import 'package:cinemapedia/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const CustomBottomNavigationBar({super.key, required this.navigationShell});

  void onItemTapped(BuildContext context, int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).fullPath ?? '/';

    switch (location) {
      case '/':
        return 0;
      case CategoriesView.routeName:
        return 1;
      case FavoritesView.routeName:
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        currentIndex: getCurrentIndex(context),
        onTap: (index) => onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Categorías'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined), label: 'Favoritos')
        ]);
  }
}
