import 'package:cinema_pedia/domain/entities/actor.dart';

abstract class ActorRepository {

  Future<List<Actor>> getActorsById(String movieId);
}