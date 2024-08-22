import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/buttons/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

final GoRouter appRouter = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage(key: state.pageKey, child: const HomeScreen())),
  GoRoute(
    path: '/cards',
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const CardsScreen(),
    ),
  ),
  GoRoute(
    path: '/buttons',
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const ButtonsScreen(),
    ),
  )
]);