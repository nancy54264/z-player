import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<GlobalState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalState>>{
    GlobalAction.action: _onAction,
  });
}

void _onAction(Action action, Context<GlobalState> ctx) {
}
