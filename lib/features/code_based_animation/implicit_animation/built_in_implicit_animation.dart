import 'package:flutter/material.dart';

class BuiltInImplicitAnimation extends StatefulWidget {
  const BuiltInImplicitAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _BuiltInImplicitAnimationState();
}

class _BuiltInImplicitAnimationState extends State<BuiltInImplicitAnimation> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Built-In Animation")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: _isExpanded ? 200 : 100,
            height: _isExpanded ? 200 : 100,
            color: _isExpanded ? Colors.blue : Colors.red,
          ),
        ),
      ),
    );
  }
}
