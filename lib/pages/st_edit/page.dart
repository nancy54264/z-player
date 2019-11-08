import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class STEditPage extends Page<STEditState, STState> {
  STEditPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<STEditState>(
                adapter: null,
                slots: <String, Dependent<STEditState>>{
                }),
            middleware: <Middleware<STEditState>>[
            ],);

}
