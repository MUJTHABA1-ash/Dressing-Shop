import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled12/Screens/Get_Started.dart';
import 'package:untitled12/Screens/Splash_Screen_1.dart';
import 'package:untitled12/main.dart';

import 'Bottom_Navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(
          Duration(seconds: 3),
              () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => BottomNavigation())));
    } else {
      Timer(
          Duration(seconds: 3),
              () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => SplashScreen1())));
    }
  }
  void initState() {

    islogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/Stylish.png",width: 300.w,))
        ],
      ),
    );
  }
}
