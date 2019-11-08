import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class ThemePage extends Page<ThemeState, Map<String, dynamic>> {
  ThemePage()
      : super(
            initState: initState,
            effect: buildEffect(),
//            reducer: buildReducer(),
            view: buildView,
//            dependencies: Dependencies<ThemeState>(
//                adapter: null,
//                slots: <String, Dependent<ThemeState>>{
//                }),
//            middleware: <Middleware<ThemeState>>[
//            ],
  );

}
