
//* se va hacer, que cuando la pantalla cargue la pelicula y el usiario vuelva a cargar la peli..
//* no se llame otra vez la peticion si no que cargue lo que esta guardado en el cache


import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:cinema_pedia/presentation/providers/movies/movie_repositories_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final moveInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepositories = ref.watch( movieRepositoryProvider );
  return MovieMapNotifier(
    getMovie:  movieRepositories.getMovieById
  );
});

typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({ 
   required this.getMovie
  }): super({});


  Future<void> loadMovie( String movieId ) async {
    if( state[movieId] != null ) return; //? si la pelicula ya esta cagadad no haga nada 

    final movie = await getMovie( movieId );

    state = {...state, movieId: movie};
  }

  
}