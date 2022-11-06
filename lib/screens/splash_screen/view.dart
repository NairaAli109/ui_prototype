import 'dart:async';

import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/size.dart';
import '../login_screen/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Timer(const Duration(seconds:2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=> const LoginScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:white ,
      body: SizedBox(
        width: width(context, 1.0),
        height: height(context, 1.0),
        child: const Image(image: AssetImage("images/logo.png")),
      ),
    );
  }
}
