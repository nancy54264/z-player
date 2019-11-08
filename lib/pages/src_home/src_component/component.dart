import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SrcComponent extends Component<SrcState> {
  SrcComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SrcState>(
                adapter: null,
                slots: <String, Dependent<SrcState>>{
                }),);

}
