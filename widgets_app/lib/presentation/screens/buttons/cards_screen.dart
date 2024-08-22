import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const String routeName = 'cards';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cards Screen'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              context.go(HomeScreen.routeName);
            },
          ),
        ),
        body: const Placeholder());
  }
}
