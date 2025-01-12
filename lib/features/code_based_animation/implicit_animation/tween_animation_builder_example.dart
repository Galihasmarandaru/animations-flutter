import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatelessWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TweenAnimationBuilder")),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 2 * 3.14),
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          builder: (context, double angle, child) {
            return Transform.rotate(
              angle: angle,
              child: child,
            );
          },
          child: const Icon(Icons.refresh, size: 100, color: Colors.blue),
        ),
      ),
    );
  }
}
