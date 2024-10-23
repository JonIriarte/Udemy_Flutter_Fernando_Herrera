import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/movieDB/credits_response.dart';
import 'package:dio/dio.dart';

class ActorsMovieDBDatasource extends ActorDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-ES'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(int movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse =
        CreditsResponse.fromJson(response.data as Map<String, dynamic>);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
