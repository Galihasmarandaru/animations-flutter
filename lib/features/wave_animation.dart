import 'package:flutter/material.dart';
import 'dart:math';

class WaveAnimation extends StatefulWidget {
  const WaveAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wave Animation")),
      body: Center(
        child: CustomPaint(
          painter: WavePainter(_controller),
          child: const SizedBox(width: double.infinity, height: 200),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Animation<double> animation;

  WavePainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    for (double x = 0; x < size.width; x++) {
      double y =
          sin((x / size.width * 2 * pi) + animation.value * 2 * pi) * 20 +
              size.height / 2;
      if (x == 0) path.moveTo(x, y);
      path.lineTo(x, y);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
