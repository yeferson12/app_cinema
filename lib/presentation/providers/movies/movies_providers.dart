import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:cinema_pedia/presentation/providers/movies/movie_repositories_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//? esta final nos trae las peliculas que viene del provider 'movie_repository'
//? y a su vez ella llama a 'MoviedbDatasources' que es de la carpeta de infrastrutura(moviedb_datasource)
final nowplayingMoviesProvider = StateNotifierProvider<MovieNotifier,List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;
  return MovieNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

//? esta class mantiene un arreglo de peliculas, 
//? y va a tener una funcion que carga la siguiente pagina de peliculas y las mantiene en memoria

class MovieNotifier extends StateNotifier<List<Movie>> {

  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MovieNotifier({
    required this.fetchMoreMovies
    }):super([]); 

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }

}