import 'package:zplayer/pages/home/list_adapter/adapter.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: NoneConn<HomeState>() + RTListAdapter(),
                slots: <String, Dependent<HomeState>>{
//                  "drawer": DrawerPage().buildComponent(bus: null, enhancer: null)
//                  'bottomBar': BottomBarComponent()
                }),
            /// 页面私有的 AOP
            middleware: <Middleware<HomeState>>[

            ],);

}

