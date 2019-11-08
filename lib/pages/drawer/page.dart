import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DrawerPage extends Page<DrawerState, Map<String, dynamic>> {
  DrawerPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DrawerState>(
                adapter: null,
                slots: <String, Dependent<DrawerState>>{
                }),
            middleware: <Middleware<DrawerState>>[
            ],);

}
