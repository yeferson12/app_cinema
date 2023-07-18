import 'package:cinema_pedia/domain/entities/actor.dart';
import 'package:cinema_pedia/presentation/providers/actors/actor_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final actorsByProvider = StateNotifierProvider<ActorByProvider, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch( actorsRepositoryProvider );
  return ActorByProvider(
    getActors: actorsRepository.getActorsById
  );
});

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorByProvider extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorByProvider({ 
   required this.getActors
  }): super({});


  Future<void> loadActors( String movieId ) async {
    if( state[movieId] != null ) return; //? si la pelicula ya esta cagadad no haga nada 

    final List<Actor> actors = await getActors( movieId );

    state = {...state, movieId: actors};
  }

  
}