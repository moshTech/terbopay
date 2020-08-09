import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terbopay/email_verify.dart';
// import 'package:terbopay/services/auth_service.dart';
import 'package:terbopay/phone_verify.dart';
import 'package:terbopay/services/auth_service.dart';
import 'package:terbopay/zip_code.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

String verificationId;

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();

  bool isPhone = true;
  String text = 'Use Phone';
  String hint = 'Your email';
  String phoneNumber = '';

  // String smsCode;
  bool codeSent = false;

  Future<void> verifyPhone(phoneNo) async {
    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      verificationId = verId;
    };

    final PhoneCodeSent phoneCodeSent = (String verId, [int forceCodeResend]) {
      verificationId = verId;

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PhoneVerify()));
    };

    final PhoneVerificationCompleted phoneVerificationCompleted =
        (AuthCredential authCredential) {
      AuthService().signIn(authCredential);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ZipCode()));
      print("Success");
    };

    final PhoneVerificationFailed phoneVerificationFailed =
        (AuthException exception) {
      print("${exception.message}");
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 5),
      verificationCompleted: phoneVerificationCompleted,
      verificationFailed: phoneVerificationFailed,
      codeSent: phoneCodeSent,
      codeAutoRetrievalTimeout: autoRetrievalTimeout,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 20,
          top: 60,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enter phone or email',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        isPhone
                            ? TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: hint,
                                  helperStyle: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.all(10),
                                height: 45,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    )),
                                child: phoneNumber.isEmpty
                                    ? Text(
                                        'Your phone (e.g +12100000000)',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      )
                                    : Text(
                                        phoneNumber,
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                              ),
                      ],
                    ),
                  ),
                  isPhone
                      ? Container()
                      : Column(
                          children: [
                            Row(
                              children: [
                                buildButton('1'),
                                buildButton('2'),
                                buildButton('3'),
                              ],
                            ),
                            Row(
                              children: [
                                buildButton('4'),
                                buildButton('5'),
                                buildButton('6'),
                              ],
                            ),
                            Row(
                              children: [
                                buildButton('7'),
                                buildButton('8'),
                                buildButton('9'),
                              ],
                            ),
                            Row(
                              children: [
                                buildButton('+'),
                                buildButton('0'),
                                buildButton('<'),
                              ],
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isPhone
                    ? Container(
                        width: 130,
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isPhone = false;
                              text = 'Use email';
                              hint = 'Your phone number';
                              emailController.text = '';
                            });
                          },
                          child: Text(
                            text,
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: 130,
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isPhone = true;
                              text = 'Use Phone';
                              hint = 'Your email';
                              phoneNumber = '';
                            });
                          },
                          child: Text(
                            text,
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ),
                Container(
                  width: 130,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    onPressed: () {
                      isPhone
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmailVerify()))
                          : verifyPhone(phoneNumber);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PhoneVerify()));
                    },
                    color: Colors.blue,
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  buildButton(String buttonText) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            if (buttonText == '<') {
              if (phoneNumber.length == 0) {
                return;
              }
              phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
            } else
              phoneNumber = phoneNumber + buttonText;
          });
        },
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
