import 'dart:async';

import 'package:flutter/material.dart';
import 'package:udemy_flutter/models/layout/home/homePageLayout.dart';

import '../choose type of user/ChooseTypeOfUser.dart';
import '../payment/Otp.dart';

class Intro extends StatefulWidget {
  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TypeOfUser())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
