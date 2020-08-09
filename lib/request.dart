import 'package:flutter/material.dart';

class RequestPay extends StatefulWidget {
  RequestPay({Key key}) : super(key: key);

  @override
  _RequestPayState createState() => _RequestPayState();
}

class _RequestPayState extends State<RequestPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.pink,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          '\$20',
          style: TextStyle(color: Colors.pink),
        ),
        actions: [
          Container(
            width: 130,
            height: 40,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              onPressed: () {},
              child: Text(
                'Request',
                style: TextStyle(fontSize: 20, color: Colors.pink),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'To:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name, \$CashTag, Email',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.pink[100],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'For:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Add a note',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.pink[100],
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
}
