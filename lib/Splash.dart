import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mr_worker/Home.dart';
import 'package:mr_worker/Register.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Timer(

        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Home())));
    return Scaffold(
      body: Container(
        color:  Colors.white10,
        child:  Center(
          child: CachedNetworkImage(imageUrl: 'https://bingo-agency.com/mrworker/img/slider%20copy.png',),
        ),
      ),
    );
  }
}


