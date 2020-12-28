// ignore: library_names
library appState;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:tema_curs5_flutter/src/models/movie.dart';

part 'appState.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() {
    return _$AppState((AppStateBuilder b) {
      b.isLoading = false;
      b.page = 1;
      b.orderBy = 'desc';
    });
  }

  AppState._();

  BuiltList<Movie> get movies;

  int get page;

  @nullable
  String get quality;

  String get orderBy;

  BuiltList<String> get genres;

  bool get isLoading;
}
