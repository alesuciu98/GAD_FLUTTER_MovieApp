import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:tema_curs5_flutter/src/actions/index.dart';
import 'package:tema_curs5_flutter/src/data/ytsApi.dart';
import 'package:tema_curs5_flutter/src/epics/app_epics.dart';
import 'package:tema_curs5_flutter/src/models/index.dart';
import 'package:tema_curs5_flutter/src/presentation/home_page.dart';
import 'package:tema_curs5_flutter/src/reducer/reducer.dart';

void main() {
  final Client client = Client();
  final YtsApi api = YtsApi(client: client);
  final AppEpics epics = AppEpics(ytsApi: api);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epics.epics),
    ],
  );

  store.dispatch(GetMovies.start(initialState.page));

  runApp(
    MaterialApp(
      home: MovieApp(store: store),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
