import 'dart:async';

import 'package:covid_trackers/src/config/ktext.dart';
import 'package:covid_trackers/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class Splashpage extends StatefulWidget {
  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.off(HomePage()));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: controller,
              child: Container(
                height: 150,
                width: 150,
                child: Center(
                  child: Image.asset('assets/icons/virus.png'),
                ),
              ),
              builder: (BuildContext context, child) {
                return Transform.rotate(
                  angle: controller.value * 2.0 * math.pi,
                  child: child,
                );
              }),
          SizedBox(
            height: size.height * 0.05,
          ),
          Align(
              alignment: Alignment.center,
              child: KText(
                text: 'Covid-19\nTrackers',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ))
        ],
      ),
    );
  }
}
