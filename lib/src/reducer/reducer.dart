import 'package:built_collection/built_collection.dart';
import 'package:tema_curs5_flutter/src/actions/get_movies.dart';
import 'package:tema_curs5_flutter/src/actions/set_genres.dart';
import 'package:tema_curs5_flutter/src/actions/set_order_by.dart';
import 'package:tema_curs5_flutter/src/actions/set_quality.dart';
import 'package:tema_curs5_flutter/src/models/appState.dart';

AppState reducer(AppState state, dynamic action) {
  final AppStateBuilder builder = state.toBuilder();

  if (action is $GetMoviesStart) {
    builder.isLoading = true;
  } else if (action is $GetMoviesSuccessful) {
    final AppStateBuilder builder = state.toBuilder();
    builder.movies.addAll(action.movies);
    builder.isLoading = false;
    builder.page = builder.page + 1;
  } else if (action is $GetMoviesError) {
    builder.isLoading = false;
  } else if (action is SetQuality) {
    builder.quality = action.quality;
    builder.movies.clear();
  } else if (action is SetGenres) {
    builder.genres = ListBuilder<String>(action.genres);
    builder.movies.clear();
  } else if (action is SetOrderBy) {
    builder.orderBy = action.orderBy;
    builder.movies.clear();
  }
  return builder.build();
}
