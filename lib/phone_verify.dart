import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terbopay/services/auth_service.dart';
import 'package:terbopay/zip_code.dart';

import 'login.dart';

class PhoneVerify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String smsCode;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 20,
          top: 80,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'We have sent a code to your phone',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter code to verify',
                      helperStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    onChanged: (val) {
                      smsCode = val;
                    },
                  ),
                  SizedBox(
                    height: 45,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ZipCode()));
                    } else {
                      AuthService()
                          .signInWithOTP(smsCode, context, verificationId);
                    }
                  });
                },
                color: Colors.blue,
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
