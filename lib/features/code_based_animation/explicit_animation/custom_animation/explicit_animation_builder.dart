import 'package:flutter/material.dart';

class ExplicitAnimationBuilder extends StatefulWidget {
  const ExplicitAnimationBuilder({super.key});

  @override
  State<StatefulWidget> createState() => _ExplicitAnimationBuilderState();
}

class _ExplicitAnimationBuilderState extends State<ExplicitAnimationBuilder>
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

    _sizeAnimation = Tween<double>(begin: 50, end: 150).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedBuilder Example")),
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
      ),
    );
  }
}
