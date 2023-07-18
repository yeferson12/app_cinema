

import 'package:cinema_pedia/domain/entities/actor.dart';
import 'package:cinema_pedia/infrastruture/models/moviedb/credits_response.dart';

class ActorMapper {

  static Actor castToEntity( Cast cast) => 
  Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
        ? 'https://image.tmdb.org/t/p/w500${ cast.profilePath }'
        : 'no-actor',
    character: cast.character
    );
  
}