
import 'package:tema_curs5_flutter/src/actions/get_movies.dart';
import 'package:tema_curs5_flutter/src/models/appState.dart';


AppState reducer(AppState state, dynamic action){
  if(action is GetMoviesSuccessful){
    final AppStateBuilder builder = state.toBuilder();
    builder.movies.addAll(action.movies);
    return builder.build();
  }

  return state;
}

