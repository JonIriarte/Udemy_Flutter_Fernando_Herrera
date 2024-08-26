import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/app_tutorial/app_tutorial_screen.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/buttons/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';
import 'package:widgets_app/presentation/screens/progress/progress_screen.dart';

final GoRouter appRouter = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage(key: state.pageKey, child: const HomeScreen())),
  GoRoute(
    path: '/cards_screen',
    name: CardsScreen.routeName,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const CardsScreen(),
    ),
  ),
  GoRoute(
    path: '/buttons_screen',
    name: ButtonsScreen.routeName,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const ButtonsScreen(),
    ),
  ),
  GoRoute(
    path: '/app_tutorial_screen',
    name: AppTutorialScreen.routeName,
    pageBuilder: (context, state) =>
        MaterialPage(key: state.pageKey, child: const AppTutorialScreen()),
  ), 
   GoRoute(
    path: '/progress_screen',
    name: ProgressScreen.routeName,
    pageBuilder: (context, state) =>
        MaterialPage(key: state.pageKey, child: const ProgressScreen()),
  )
]);
