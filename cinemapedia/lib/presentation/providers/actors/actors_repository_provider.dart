import 'package:cinemapedia/infrastructure/datasources/actors_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImplementation(ActorsMovieDBDatasource());
});
