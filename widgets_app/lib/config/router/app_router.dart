import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

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
  ),
  GoRoute(
    path: '/snackbar_screen',
    name: SnackbarScreen.routeName,
    pageBuilder: (context, state) =>
        MaterialPage(key: state.pageKey, child: const SnackbarScreen()),
  ),
  GoRoute(
    path: '/animated_screen',
    name: AnimatedScreen.routeName,
    pageBuilder: (context, state) =>
        MaterialPage(key: state.pageKey, child: const AnimatedScreen()),
  ), 
  GoRoute(
    path: '/ui_controls_screen',
    name: UIControlsScreen.routeName,
    pageBuilder: (context, state) =>
        MaterialPage(key: state.pageKey, child: const UIControlsScreen()),
  )
]);
