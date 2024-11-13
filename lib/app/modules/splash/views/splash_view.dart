import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDC300),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'ArenaKu.id',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff211A2C),
              ),
            ),
            const Text(
              'Sewa Lapangan Menjadi Mudah',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff211A2C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
