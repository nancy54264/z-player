import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';
import 'effect.dart';
import 'reducer.dart';

class AppPage extends Page<AppState, Map<String, dynamic>> {
  AppPage()
      : super(
            initState: initState,
            view: buildView,
            effect: buildEffect(),
            reducer: buildReducer()
  );

}
