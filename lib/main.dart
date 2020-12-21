import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:tema_curs5_flutter/src/actions/get_movies.dart';
import 'package:tema_curs5_flutter/src/data/ytsApi.dart';
import 'package:tema_curs5_flutter/src/middleware/app_middleware.dart';
import 'package:tema_curs5_flutter/src/models/appState.dart';
import 'package:tema_curs5_flutter/src/presentation/home_page.dart';
import 'package:tema_curs5_flutter/src/reducer/reducer.dart';

void main() {
  final Client client = Client();
  final YtsApi api = YtsApi(client: client);
  final AppMiddleware appMiddleware = AppMiddleware(ytsApi: api);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: appMiddleware.middleware,
  );

  store.dispatch(const GetMovies());

  runApp(MaterialApp(
    home: MovieApp(store: store),
  ));
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
