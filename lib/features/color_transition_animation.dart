import 'package:flutter/material.dart';

class ColorTransitionAnimation extends StatefulWidget {
  const ColorTransitionAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _ColorTransitionAnimationState();
}

class _ColorTransitionAnimationState extends State<ColorTransitionAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Code-Based Animation")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward(from: 0);
          },
          child: AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return Container(
                width: 100,
                height: 50,
                color: _colorAnimation.value,
                alignment: Alignment.center,
                child:
                    const Text("Tap Me", style: TextStyle(color: Colors.white)),
              );
            },
          ),
        ),
      ),
    );
  }
}
