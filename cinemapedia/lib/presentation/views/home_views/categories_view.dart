import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  static const String routeName = '/categories_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías view'),
      ),
      body: const Center(
        child: Text('Categorías'),
      ),
    );
  }
}
