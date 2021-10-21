import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/sidebar/sidebar_layout.dart';
import 'package:saadoptionsystem/Splash/Splash.dart';
import 'package:saadoptionsystem/Splash/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants.dart';

import 'Login/Login.dart';
import 'Register/SignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SA ADOPTION',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "Login": (BuildContext context) => Login(),
        "SideLayout": (BuildContext context) => SideBarLayout(),
        "SignUp": (BuildContext context) => SignUp(),
        "start": (BuildContext context) => WelcomeScreen(),
      },
    );
  }
}
