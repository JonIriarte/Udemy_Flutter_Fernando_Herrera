import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/movieDB/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://media.istockphoto.com/id/1055079680/es/vector/c%C3%A1mara-lineal-negro-como-ninguna-imagen-disponible.jpg?s=1024x1024&w=is&k=20&c=Scr2FpsPx00Lyo9k_bgiwEr82h6TC1KOOPZVVKHjRT0=',
      character: cast.character);
}
