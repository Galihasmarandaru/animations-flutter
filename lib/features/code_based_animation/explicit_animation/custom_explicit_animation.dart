import 'package:flutter/material.dart';

class CustomExplicitAnimation extends StatefulWidget {
  const CustomExplicitAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _CustomExplicitAnimationState();
}

class _CustomExplicitAnimationState extends State<CustomExplicitAnimation>
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
      appBar: AppBar(title: const Text("Custom Explicit Animation")),
      body: Center(
        child: CustomPaint(
          painter: CirclePainter(_sizeAnimation),
          child: const SizedBox(width: 200, height: 200),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Animation<double> animation;

  CirclePainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      animation.value,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
