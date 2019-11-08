import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RTComponent extends Component<RTState> {
  RTComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            );

}
