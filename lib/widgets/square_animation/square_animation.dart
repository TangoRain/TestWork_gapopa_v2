import 'package:flutter/material.dart';

enum Direction { left, right }

class SquareAnimation extends StatefulWidget {
  final Duration duration;
  const SquareAnimation({super.key, required this.duration});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {
  static const _squareSize = 50.0;
  bool _isAnimating = false;
  double position = -1;

  void _moveSquare(Direction dir) {
    setState(() {
      _isAnimating = true;
      switch (dir) {
        case Direction.right:
          position = 1;
          break;
        case Direction.left:
          position = -1;
      }
    });

    Future.delayed(widget.duration, () {
      setState(() {
        _isAnimating = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          width: screenWidth,
          child: AnimatedContainer(
            duration: widget.duration,
            width: screenWidth,
            alignment: Alignment(position, 0),
            child: SizedBox.square(
              dimension: _squareSize,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _animationRules(Direction.left),
              child: const Text('Left'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _animationRules(Direction.right),
              child: const Text('Right'),
            ),
          ],
        ),
      ],
    );
  }

  void Function()? _animationRules(Direction dir) {
    switch (dir) {
      case Direction.right:
        return _isAnimating
            ? null
            : (position == 1 ? null : () => _moveSquare(dir));
      case Direction.left:
        return _isAnimating
            ? null
            : (position == -1 ? null : () => _moveSquare(dir));
    }
  }
}
