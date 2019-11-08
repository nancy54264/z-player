
import 'package:zplayer/pages/home/rt_component/state.dart';
import 'package:zplayer/pages/src_home/pipe.dart';
import 'package:zplayer/pages/src_home/src_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
//import 'package:video_player/video_player.dart';
//import 'package:chewie/chewie.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class PlayerState implements Cloneable<PlayerState> {

  SrcState src;
  RTState rt;
  IjkMediaController controller;
  List<DD> dl;
  DD d;

  bool isRt;
//  Future initController;

  @override
  PlayerState clone() {
    return PlayerState()
      ..src = src
      ..rt = rt
      ..controller = controller
      ..d = d
      ..isRt = isRt
      ..dl = dl
    ;
  }
}

PlayerState initState(dynamic o) {
  final PlayerState state = PlayerState();
  if(o is SrcState){
    state.src = o;
    state.d = o.dl[0];
    state.dl = o.dl;
    state.isRt = false;
  }else if(o is RTState){
    state.rt = o;
    DD d = DD(name: o.title, src: o.uri);
    state.d = d;
    state.dl = <DD>[d];
    state.isRt = true;
  }


  state.controller = IjkMediaController();

//  state.initController = state.controller.initialize();

  return state;
}
