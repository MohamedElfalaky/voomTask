import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:voom_task/View/OnBoarding.dart';
import 'package:voom_task/helpers/my_application.dart';
import 'package:voom_task/main.dart';
import 'package:voom_task/style/icons_file.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      MyApplication.navigateToReplace(const OnBoarding(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Lottie.asset(
            onBording4,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Image.asset(
                logo111,
                height: 350,
              ),
            )),
      ],
    );
  }
}
