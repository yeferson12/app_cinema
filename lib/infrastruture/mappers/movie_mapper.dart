import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:cinema_pedia/infrastruture/models/moviedb/movie_moviedb.dart';

class MoviMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
        ? 'http//image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
        : '',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath:( moviedb.posterPath != '')
        ? 'http//image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
        : 'no-poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
