import 'package:cinemapedia/presentation/providers/storage/favourite_movies_provider.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  static const String routeName = '/favorites_view';

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;
  @override
  void initState() {
    ref.read(favouriteMoviesProvider.notifier).loadNextPage();
    super.initState();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;

    final movies =
        await ref.read(favouriteMoviesProvider.notifier).loadNextPage();

    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favouriteMovies = ref.watch(favouriteMoviesProvider).values.toList();

    if (favouriteMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline_sharp,
              size: 60,
              color: colors.primary,
            ),
            Text(
              'No hay favoritos',
              style: TextStyle(fontSize: 30, color: colors.primary),
            ),
            const Text(
              'Añade las películas que quieras y se verán aquí',
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonal(
                onPressed: () => context.go(HomeScreen.routeName),
                child: const Text('Inicio'))
          ],
        ),
      );
    }

    return Scaffold(
        body: MovieMasonry(
      movies: favouriteMovies,
      loadNextPage: loadNextPage,
    ));
  }
}
