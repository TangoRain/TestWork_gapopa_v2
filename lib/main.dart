import 'package:flutter/material.dart';
import 'package:red_sq/widgets/square_animation/square_animation.dart';

enum Direction { left, right }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(32.0),
          child: SquareAnimation(
            duration: Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
