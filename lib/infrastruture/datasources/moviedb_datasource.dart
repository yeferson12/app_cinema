import 'package:dio/dio.dart';
import 'package:cinema_pedia/config/constants/environment.dart';
import 'package:cinema_pedia/domain/datasources/movies_datasource.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:cinema_pedia/infrastruture/mappers/movie_mapper.dart';
import 'package:cinema_pedia/infrastruture/models/moviedb/moviedb_response.dart';

class MoviedbDatasources extends MovieDastasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing');
    final moveDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movie = moveDBResponse.results
    .where((movidb) => movidb.posterPath != 'no-poster')
    .map(
      (moviedb) => MoviMapper.movieDBToEntity(moviedb)
    ).toList();

    return movie;
  }
} 
