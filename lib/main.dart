import 'package:animations_demo/features/code_based_animation/code_based_animation.dart';
import 'package:animations_demo/features/code_based_animation/explicit_animation/built_in_explicit_animation.dart';
import 'package:animations_demo/features/code_based_animation/explicit_animation/curved_animation_example.dart';
import 'package:animations_demo/features/code_based_animation/explicit_animation/custom_animation/custom_explicit_animation.dart';
import 'package:animations_demo/features/code_based_animation/explicit_animation/custom_animation/explicit_animation_builder.dart';
import 'package:animations_demo/features/code_based_animation/explicit_animation/custom_animation/explicit_animation_widget.dart';
import 'package:animations_demo/features/code_based_animation/explicit_animation/explicit_animation.dart';
import 'package:animations_demo/features/code_based_animation/implicit_animation/built_in_implicit_animation.dart';
import 'package:animations_demo/features/code_based_animation/implicit_animation/implicit_animation.dart';
import 'package:animations_demo/features/code_based_animation/implicit_animation/tween_animation_builder_example.dart';
import 'package:animations_demo/features/color_transition_animation.dart';
import 'package:animations_demo/features/drawing_based_animation/drawing_based_animation.dart';
import 'package:animations_demo/features/tween_animation.dart';
import 'package:animations_demo/features/wave_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Animation Demo',

      // --- General Animation ---
      // home: TweenAnimation(),
      // home: DrawingBasedAnimation(),
      // home: CodeBasedAnimation(),
      // home: WaveAnimation(),
      // home: ColorTransitionAnimation(),

      // --- Implicit Animation ---
      // home: BuiltInImplicitAnimation(),
      // home: ImplicitAnimation(),
      // home: TweenAnimationBuilderExample(),

      // --- Explicit Animation ---
      // home: BuiltInExplicitAnimation(),
      // home: ExplicitAnimation(),
      // home: CustomExplicitAnimation(),
      // home: ExplicitAnimationWidget(),
      // home: ExplicitAnimationBuilder(),
      home: CurvedAnimationExample(),
    );
  }
}
