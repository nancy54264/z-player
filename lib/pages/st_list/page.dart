import 'package:zplayer/pages/st_list/list_adapter/adapter.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class STHomePage extends Page<STHomeState, Map<String, dynamic>> {
  STHomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<STHomeState>(
                adapter: NoneConn<STHomeState>() + STListAdapter(),
                slots: <String, Dependent<STHomeState>>{

                }),
            middleware: <Middleware<STHomeState>>[
            ],);

}
