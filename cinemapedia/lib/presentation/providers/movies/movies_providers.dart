import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNextMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchNextMovies: fetchNextMovies);
});

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNextMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchNextMovies: fetchNextMovies);
});

final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNextMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifier(fetchNextMovies: fetchNextMovies);
});

final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNextMovies = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesNotifier(fetchNextMovies: fetchNextMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchNextMovies;

  MoviesNotifier({
    required this.fetchNextMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchNextMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
