import 'dart:async';

import 'package:flutter/material.dart';

import 'package:netflix_app/homescreen.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    // TODO: implement initState
    goToHome(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(child: Image.asset('assets/images/label.png')) ,
    );
  }

  
}

Future<void> goToHome(context) async {
  Timer(const Duration(seconds: 2), (() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => homescreen()));   
  }));
}