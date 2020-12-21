// ignore: library_names
library appState;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:tema_curs5_flutter/src/models/movie.dart';

part 'appState.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void Function(AppStateBuilder b) updates]) = _$AppState;

  AppState._();

  BuiltList<Movie> get movies;
}
