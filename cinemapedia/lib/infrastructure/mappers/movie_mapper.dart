import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/movieDB/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
      adult: movieDB.adult,
      backdropPath: movieDB.backdropPath != ''
          ? 'http://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
          : 'https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png',
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: movieDB.posterPath != ''
          ? 'http://image.tmdb.org/t/p/w500${movieDB.posterPath}'
          : 'no-poster',
      releaseDate: movieDB.releaseDate,
      title: '',
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount);
}
