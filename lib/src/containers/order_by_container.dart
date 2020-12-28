import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/src/store.dart';
import 'package:tema_curs5_flutter/src/models/appState.dart';

class OrderByContainer extends StatelessWidget {
  const OrderByContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<String> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (Store<AppState> store) => store.state.orderBy,
      builder: builder,
    );
  }
}
