import 'package:flutter/material.dart';
import 'package:terbopay/home.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Welcome to Terbo Pay',
              style: TextStyle(
                fontSize: 30,
                color: Colors.pink[200],
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
