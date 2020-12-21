import 'package:tema_curs5_flutter/src/models/movie.dart';

class GetMovies {
  const GetMovies();
}

class GetMoviesSuccessful {
  const GetMoviesSuccessful(this.movies);
  final List<Movie> movies;
}

class GetMoviesError {
  const GetMoviesError(this.error);
  final dynamic error;
}
