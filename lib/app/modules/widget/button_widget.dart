import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double height;
  final double width;
  final double radius;

  const Button({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 40,
    this.width = double.infinity,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFDC300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Mulish',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff211A2C),
          ),
        ),
      ),
    );
  }
}
