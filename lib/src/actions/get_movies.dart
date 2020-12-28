library get_movies;

import 'package:tema_curs5_flutter/src/models/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_movies.freezed.dart';

@freezed
abstract class GetMovies with _$GetMovies {
  const factory GetMovies.start(int page) = $GetMoviesStart;

  const factory GetMovies.successful(List<Movie> movies) = $GetMoviesSuccessful;

  const factory GetMovies.error(dynamic error) = $GetMoviesError;
}
