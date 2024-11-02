import 'dart:async';

import 'package:covidtracker/screens/WorldStatsScreen/components/world_stats_body.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WorldStatsBody()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi,
                child: child,
              );
            },
            child: Container(
              height: 200,
              width: 200,
              child: Center(
                child: Image(image: AssetImage("assets/images/virus.png")),
              ),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * .08,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            "Covid-19 \n Tracker App",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    )));
  }
}
