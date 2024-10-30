import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    _buildMainShellRoute(),
  ],
);

StatefulShellRoute _buildMainShellRoute() {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return HomeScreen(navigationShell: navigationShell);
    },
    branches: <StatefulShellBranch>[
      _buildHomeBranch(),
      _buildCategoriesBranch(),
      _buildFavoritesBranch(),
    ],
  );
}

StatefulShellBranch _buildHomeBranch() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
        routes: <RouteBase>[
          _buildMovieRoute(),
        ],
      ),
    ],
  );
}

GoRoute _buildMovieRoute() {
  return GoRoute(
    path: 'movie/:id',
    name: MovieScreen.routeName,
    builder: (context, state) {
      final movieId = int.parse(state.pathParameters['id']!);
      return MovieScreen(movieId: movieId);
    },
  );
}

StatefulShellBranch _buildCategoriesBranch() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: CategoriesView.routeName,
        builder: (context, state) => const CategoriesView(),
      ),
    ],
  );
}

StatefulShellBranch _buildFavoritesBranch() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: FavoritesView.routeName,
        builder: (context, state) => const FavoritesView(),
      ),
    ],
  );
}
