import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/btmnav.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Btmnav()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF067B6C),
      body: Center(child: Lottie.asset("assets/animations/splash_animation.json",fit: BoxFit.cover)),
    );
  }
}
