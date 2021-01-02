import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:tema_curs5_flutter/src/actions/index.dart';
import 'package:tema_curs5_flutter/src/models/index.dart';

Reducer<AppState> reducer = combineReducers(
  <Reducer<AppState>>[
    TypedReducer<AppState, $GetMoviesStart>(_getMoviesStart),
    TypedReducer<AppState, $GetMoviesSuccessful>(_getMoviesSuccessful),
    TypedReducer<AppState, $GetMoviesError>(_getMoviesError),
    TypedReducer<AppState, SetQuality>(_setQuality),
    TypedReducer<AppState, SetGenres>(_setGenres),
    TypedReducer<AppState, SetOrderBy>(_setOrderBy),
  ],
);

AppState _getMoviesStart(AppState state, $GetMoviesStart action) {
  return state.rebuild((AppStateBuilder b) => b.isLoading = true);
}

AppState _getMoviesSuccessful(AppState state, $GetMoviesSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.movies.addAll(action.movies);
    b.isLoading = false;
    b.page = state.page + 1;
  });
}

AppState _getMoviesError(AppState state, $GetMoviesError action) {
  return state.rebuild((AppStateBuilder b) => b.isLoading = false);
}

AppState _setQuality(AppState state, SetQuality action) {
  return state.rebuild((AppStateBuilder b) {
    b.quality = action.quality;
    b.movies.clear();
  });
}

AppState _setGenres(AppState state, SetGenres action) {
  return state.rebuild((AppStateBuilder b) {
    b.genres = ListBuilder<String>(action.genres);
    b.movies.clear();
  });
}

AppState _setOrderBy(AppState state, SetOrderBy action) {
  return state.rebuild((AppStateBuilder b) {
    b.orderBy = action.orderBy;
    b.movies.clear();
  });
}
