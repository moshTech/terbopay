import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:terbopay/splashscreen.dart';

import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Terbo Pay',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Roboto',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: AuthService().handleAuth(),
  ));
}
