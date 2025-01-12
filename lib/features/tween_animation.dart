import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Initialize the controller
    _controller = AnimationController(
      vsync: this, // This is required for the ticker (syncing animation frames)
      duration: const Duration(seconds: 2), // Duration of the animation
    );

    // 2. Define the animation using Tween
    _sizeAnimation = Tween<double>(begin: 50.0, end: 200.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // 3. Start the animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    // Always dispose the controller when done to prevent memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animation Demo')),
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value, // Animated size
              height: _sizeAnimation.value,
              color: Colors.blue,
            );
          },
        ),
      ),
    );
  }
}
