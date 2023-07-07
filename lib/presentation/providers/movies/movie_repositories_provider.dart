

import 'package:cinema_pedia/infrastruture/datasources/moviedb_datasource.dart';
import 'package:cinema_pedia/infrastruture/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl( MoviedbDatasources());
});