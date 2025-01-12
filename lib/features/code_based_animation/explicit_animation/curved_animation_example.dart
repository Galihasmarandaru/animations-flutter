import 'package:flutter/material.dart';

class CurvedAnimationExample extends StatefulWidget {
  const CurvedAnimationExample({super.key});

  @override
  State<StatefulWidget> createState() => _CurvedAnimationExampleState();
}

class _CurvedAnimationExampleState extends State<CurvedAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Menggunakan CurvedAnimation
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _sizeAnimation =
        Tween<double>(begin: 50, end: 150).animate(curvedAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Curved Animation Example")),
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
      ),
    );
  }
}
