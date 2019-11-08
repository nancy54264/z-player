import 'package:zplayer/pages/src_home/src_adapter/adapter.dart';
import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SrcHomePage extends Page<SrcHomeState, STState> {
  SrcHomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SrcHomeState>(
                adapter: NoneConn<SrcHomeState>() + SrcListAdapter(),
                slots: <String, Dependent<SrcHomeState>>{

                }),
            middleware: <Middleware<SrcHomeState>>[
            ],);

}

//class SrcListAdapter extends ConnOp<>{
//
//}