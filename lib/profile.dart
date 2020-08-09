import 'package:flutter/material.dart';
import 'package:terbopay/login.dart';
import 'package:terbopay/services/auth_service.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          IconButton(
              icon: Icon(
                Icons.dashboard,
                color: Colors.pink,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.camera_alt),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Francisca',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '\$francajtf',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  title: Text(
                    'Personal',
                    style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ListTile(
                  leading: Icon(
                    Icons.verified_user,
                    color: Colors.pink,
                  ),
                  title: Text(
                    'Privacy & Security',
                    style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.pink,
                  ),
                  title: Text(
                    'Notifications',
                    style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ListTile(
                  leading: Icon(
                    Icons.note,
                    color: Colors.pink,
                  ),
                  title: Text(
                    'Documents',
                    style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.pink,
                  ),
                  title: Text(
                    'Support',
                    style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  'Enter Referral Code',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                    AuthService().signOut();
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.pink,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Privacy Policy, Terms of Service,',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pink,
                  ),
                ),
                Text(
                  'and Open Source software',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
