import 'package:cinemapedia/presentation/providers/storage/favourite_movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  static const String routeName = '/favorites_view';

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    ref.read(favouriteMoviesProvider.notifier).loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favouriteMovies = ref.watch(favouriteMoviesProvider).values.toList();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Favoritos view'),
        ),
        body: ListView.builder(
            itemCount: favouriteMovies.length,
            itemBuilder: (context, index) {
              final movie = favouriteMovies[index];

              return ListTile(
                title: Text(movie.title),
              );
            }));
  }
}
