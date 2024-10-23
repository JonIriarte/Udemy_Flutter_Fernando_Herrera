import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorByMovieNotifier, Map<int, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorRepositoryProvider);

  return ActorByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});
typedef GetActorsCallback = Future<List<Actor>> Function(int movieId);

class ActorByMovieNotifier extends StateNotifier<Map<int, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(int movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
