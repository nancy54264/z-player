import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlayerPage extends Page<PlayerState, dynamic> {
  PlayerPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlayerState>(
                adapter: null,
                slots: <String, Dependent<PlayerState>>{
                }),
            middleware: <Middleware<PlayerState>>[
            ],);

}
