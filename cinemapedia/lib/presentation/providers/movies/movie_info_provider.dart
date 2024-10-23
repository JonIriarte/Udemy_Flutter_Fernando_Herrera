import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<int, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});
typedef GetMovieCallBack = Future<Movie> Function(int movieId);

class MovieMapNotifier extends StateNotifier<Map<int, Movie>> {
  final GetMovieCallBack getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(int movieId) async {
    if (state[movieId] != null) return;
   
    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
