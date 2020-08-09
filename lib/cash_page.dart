import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:terbopay/pay.dart';
import 'package:terbopay/profile.dart';
import 'package:terbopay/request.dart';

class CashPage extends StatefulWidget {
  @override
  _CashPageState createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  double amount = 0;
  String number = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 20,
          top: 40,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.crop_free,
                            color: Colors.pink,
                            size: 35,
                          ),
                          onPressed: () {}),
                      IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.pink,
                          size: 35,
                        ),
                        onPressed: () => pushNewScreen(
                          context,
                          screen: Profile(),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  number.length == 0
                      ? Text(
                          '\$0$number',
                          style: TextStyle(
                            fontSize: 70,
                            color: Colors.pink,
                          ),
                        )
                      : Text(
                          '\$$number',
                          style: TextStyle(
                            fontSize: 70,
                            color: Colors.pink,
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
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
                buildButton('.'),
                buildButton('0'),
                buildButton('<'),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () => pushNewScreen(
                    context,
                    screen: RequestPay(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  ),
                  child: Text(
                    'Request',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.pink,
                    ),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () => pushNewScreen(
                    context,
                    screen: Pay(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  ),
                  child: Text(
                    'Pay',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.pink,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
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
              if (number.length == 0) {
                return;
              }
              number = number.substring(0, number.length - 1);
            } else if (buttonText == '.' && number.contains('.')) {
              return;
            } else if (number.length == 0 && buttonText == '0') {
              return;
            } else if (number.length == 6) {
              return;
            } else
              number = number + buttonText;
          });
        },
        onLongPress: () {
          setState(() {
            if (buttonText == '<') {
              number = '';
            } else {
              return;
            }
          });
        },
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.pink,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
