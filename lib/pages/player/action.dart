import 'package:fish_redux/fish_redux.dart';
import 'package:zplayer/pages/src_home/pipe.dart';

//TODO replace with your own action
enum PlayerAction { action, onSelectEpisode, selectEpisode }

class PlayerActionCreator {
  static Action onAction() {
    return const Action(PlayerAction.action);
  }

  static Action onSelectEpisodeAction(DD dd){
    return Action(PlayerAction.onSelectEpisode, payload: dd);
  }

  static Action selectEpisodeAction(DD dd){
    return Action(PlayerAction.selectEpisode, payload: dd);
  }


}
