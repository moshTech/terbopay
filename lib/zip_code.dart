import 'package:flutter/material.dart';
import 'package:terbopay/firstname.dart';

class ZipCode extends StatelessWidget {
  const ZipCode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    'Enter your ZIP Code',
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
                      hintText: 'Zip code',
                      helperStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstName()));
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
