import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:terbopay/deposit_transfer.dart';
import 'package:terbopay/profile.dart';

class Banking extends StatefulWidget {
  @override
  _BankingState createState() => _BankingState();
}

class _BankingState extends State<Banking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 20,
          top: 10,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.pink,
                  ),
                ),
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
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                '\$0.00',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Cash Balance',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                ),
              ),
            ),
            SizedBox(
              height: 60,
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
                  onPressed: () {},
                  child: Text(
                    'Add Cash',
                    style: TextStyle(
                      fontSize: 20,
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
                  onPressed: () {},
                  child: Text(
                    'Cash Out',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '041 215 663',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Routing',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '88 **** ****',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            ListTile(
              onTap: () => pushNewScreen(
                context,
                screen: DepositAndTransfer(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ),
              leading: Container(
                width: 40,
                height: 40,
                color: Colors.pinkAccent,
                child: Icon(Icons.swap_vert),
              ),
              title: Text(
                'Deosits & Transfers',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                width: 40,
                height: 40,
                color: Colors.pinkAccent,
                child: Center(child: Text('B', style: TextStyle(fontSize: 20))),
              ),
              title: Text(
                'Bitcoin',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.pink,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                width: 40,
                height: 40,
                color: Colors.pinkAccent,
                child: Icon(Icons.add),
              ),
              title: Text(
                'Link Bank',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.pink,
                ),
              ),
              // trailing: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
