


import 'package:cinema_pedia/domain/entities/actor.dart';

abstract class ActorDatasource {

  Future<List<Actor>> getActorsById(String movieId);
}