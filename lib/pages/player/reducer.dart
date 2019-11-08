import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'action.dart';
import 'state.dart';

Reducer<PlayerState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayerState>>{
      PlayerAction.selectEpisode: _selectEpisode
    },
  );
}


PlayerState _selectEpisode(PlayerState state, Action action){
  print(action.payload);
  return state.clone()
    ..d = action.payload
    ..controller = IjkMediaController()
  ;
}
