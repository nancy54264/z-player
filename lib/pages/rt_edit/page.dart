import 'package:zplayer/pages/home/rt_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';

import 'state.dart';
import 'view.dart';

class RTEditPage extends Page<RTEditState, RTState> {
  RTEditPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<RTEditState>(
                adapter: null,
                slots: <String, Dependent<RTEditState>>{
                }),
            middleware: <Middleware<RTEditState>>[
            ],);

}
