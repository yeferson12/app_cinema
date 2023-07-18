

import 'package:cinema_pedia/infrastruture/datasources/actor_moviedb_datasource.dart';
import 'package:cinema_pedia/infrastruture/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImple( ActorMovieDbDatasource());
});