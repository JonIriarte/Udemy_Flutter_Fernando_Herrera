import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/movieDB/movie_details.dart';
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

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
      adult: movie.adult,
      backdropPath: movie.backdropPath != ''
          ? 'http://image.tmdb.org/t/p/w500${movie.backdropPath}'
          : 'https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png',
      genreIds: movie.genres.map((e) => e.name).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath != ''
          ? 'http://image.tmdb.org/t/p/w500${movie.posterPath}'
          : 'no-poster',
      releaseDate: movie.releaseDate,
      title: '',
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount);
}
