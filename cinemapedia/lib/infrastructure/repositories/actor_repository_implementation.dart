import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImplementation extends ActorRepository {
  final ActorDatasource datasource;

  ActorRepositoryImplementation(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(int movieId) async {
    return datasource.getActorsByMovie(movieId);
  }
}
