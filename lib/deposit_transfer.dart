import 'package:flutter/material.dart';

class DepositAndTransfer extends StatefulWidget {
  @override
  _DepositAndTransferState createState() => _DepositAndTransferState();
}

class _DepositAndTransferState extends State<DepositAndTransfer> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          'Deposits & Transfers',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: 50,
            color: Colors.black12,
            child: Text(
              'DIRECT DEPOSIT',
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
              child: Text(
            ' 041 215 663',
            style: TextStyle(
              fontSize: 20,
              color: Colors.pink,
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'ROUTING',
            style: TextStyle(
              fontSize: 20,
              color: Colors.pink,
            ),
          )),
          SizedBox(
            height: 40,
          ),
          Center(
              child: Text(
            '88 ****',
            style: TextStyle(
              fontSize: 20,
              color: Colors.pink,
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'ACCOUNT',
            style: TextStyle(
              fontSize: 20,
              color: Colors.pink,
            ),
          )),
          SizedBox(
            height: 40,
          ),
          Divider(),
          Center(
            child: Container(
              height: 50,
              child: Text(
                'Enable Direct Deposit',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.black12,
            child: Center(
                child: Text(
              'RECURRING',
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              'Auto Add Cash',
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
            isThreeLine: true,
            subtitle: Text(
              'Automatically add funds to the Terbo Pay app from your bank',
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
            trailing: Switch(
              value: value,
              onChanged: (bool newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
          ),
          ListTile(
              leading: Text(
                'Frequency',
                style: TextStyle(
                  color: Colors.pink,
                ),
              ),
              trailing: Text(
                'OFF',
                style: TextStyle(
                  color: Colors.pink,
                ),
              )),
          ListTile(
              leading: Text(
                'Amount',
                style: TextStyle(
                  color: Colors.pink,
                ),
              ),
              trailing: Text(
                'OFF',
                style: TextStyle(
                  color: Colors.pink,
                ),
              )),
          Container(
            height: 50,
            color: Colors.black12,
            child: Center(
                child: Text(
              'RECURRING',
              style: TextStyle(
                color: Colors.pink,
              ),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Text(
              'Send',
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
            subtitle: Text(
              '\$2,500 per Week',
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
