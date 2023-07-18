import 'package:cinema_pedia/config/constants/environment.dart';
import 'package:cinema_pedia/domain/datasources/actors_datasource.dart';
import 'package:cinema_pedia/domain/entities/actor.dart';
import 'package:cinema_pedia/infrastruture/mappers/actor_mapper.dart';
import 'package:cinema_pedia/infrastruture/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorsById(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    

    final castResponse = CreditsRenponse.fromJson(response.data);

     List<Actor> actors =  castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
      ).toList();

    return actors;
  }
}
