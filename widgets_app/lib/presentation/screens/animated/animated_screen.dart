import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  static const routeName = 'animated_screen';

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 15;
    height = random.nextInt(400) + 15;
    color = Color.fromARGB(random.nextInt(255), random.nextInt(255),
        random.nextInt(255), random.nextInt(255));
    borderRadius = random.nextInt(50) + 1;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Container'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              GoRouter.of(context).go(HomeScreen.routeName);
            },
          ),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.bounceIn,
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => changeShape(),
          child: const Icon(Icons.play_arrow),
        ));
  }
}
