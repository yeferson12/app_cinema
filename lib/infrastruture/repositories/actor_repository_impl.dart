

import 'package:cinema_pedia/domain/datasources/actors_datasource.dart';
import 'package:cinema_pedia/domain/entities/actor.dart';
import 'package:cinema_pedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImple extends ActorRepository {

  final ActorDatasource datasource;
  ActorRepositoryImple(this.datasource);

  @override
  Future<List<Actor>> getActorsById(String movieId) async {
    return datasource.getActorsById(movieId);   
  }
  
}