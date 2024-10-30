import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  static const String routeName = '/favorites_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos view'),
      ),
      body: const Center(
        child: Text('Favoritos'),
      ),
    );
  }
}
