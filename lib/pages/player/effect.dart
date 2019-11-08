import 'package:zplayer/global/application.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:wakelock/wakelock.dart';

Effect<PlayerState> buildEffect() {
  return combineEffects(<Object, Effect<PlayerState>>{
    Lifecycle.dispose: _dispose,
    Lifecycle.build: _build,
    PlayerAction.onSelectEpisode: _onSelectEpisode
  });
}

void _dispose(Action action, Context<PlayerState> ctx){
  ctx.state.controller?.dispose();

  // 关闭屏幕常亮
  Wakelock.disable();
  print("Video Player Controller dispose!");
}

void _build(Action action, Context<PlayerState> ctx) async{
//  print("Lifecycle -> Build -> Set Player Controller!");

  if (Application.env.release){
    await ctx.state.controller.setNetworkDataSource(ctx.state.d.src);

    // 由于播放器暂不支持播放时，屏幕常亮。这边默认进入播放页面开启页面常亮
    Wakelock.enable();
  }
  BotToast.showText(text: "加载资源!");
  BotToast.showText(text: "Env -> ${Application.env}");
}

void _onSelectEpisode(Action action, Context<PlayerState> ctx){
  // do something
  // ...
  // 先释放当前资源控制器
  ctx.state.controller?.dispose();
  ctx.dispatch(PlayerActionCreator.selectEpisodeAction(action.payload));
}

