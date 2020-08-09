import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terbopay/splashscreen.dart';

import '../home.dart';
import '../zip_code.dart';
// import '../login.dart';

class AuthService {
  // Handle Auth
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Home();
        } else {
          return SplashScreen();
        }
      },
    );
  }

  // SignIn
  signIn(AuthCredential authCredential) {
    FirebaseAuth.instance.signInWithCredential(authCredential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signInWithOTP(smsCode, context, verificationId) {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: smsCode);
    FirebaseAuth.instance
        .signInWithCredential(authCredential)
        .then((value) => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ZipCode())))
        .catchError((e) => print(e));
  }
}
