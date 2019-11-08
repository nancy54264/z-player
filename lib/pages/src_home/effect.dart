import 'dart:math';

import 'package:zplayer/pages/src_home/src_adapter/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:bot_toast/bot_toast.dart';
import 'action.dart';
import 'state.dart';
import 'pipe.dart';

Effect<SrcHomeState> buildEffect() {
  return combineEffects(<Object, Effect<SrcHomeState>>{
    Lifecycle.initState: _init,
    SrcHomeAction.onLoad: _onLoad,
    SrcHomeAction.onSelectType: _onSelectType,
    SrcHomeAction.onKeyWard: _onKeyWord
  });
}

void _init(Action action, Context<SrcHomeState> ctx){
  STPipe pipe = STPipe();
  pipe.get(ctx.state.st.httpsApi).then(
      (response) {
        ctx.dispatch(SrcHomeActionCreator.initAction(response));

//        ctx.dispatch(SrcListActionCreator.addAction(response.srcList));
      }
  );
}


void _onLoad(Action action, Context<SrcHomeState> ctx){
  STPipe pipe = STPipe();
//  Map<String, String> params = {
//    "pg": (int.parse(ctx.state.page) + 1).toString()
//  };
//
//
//  if(ctx.state.t.id != "0"){
//    params['t'] = ctx.state.t.id;
//  }
  pipe.get(ctx.state.st.httpsApi,
      params: ctx.state.getQueryParams(nextPage: true)).then((response){
    if( response.srcList.length <= 0){
      BotToast.showText(text: "已经是全部啦!!!");
    }else{
      ctx.dispatch(SrcHomeActionCreator.loadAction(response));
    }
  });
//  pipe.get(api)

}


void _onSelectType(Action action, Context<SrcHomeState> ctx){
  Ty t = action.payload;
  ctx.state.t = t;
  STPipe pipe = STPipe();
//  var params = {"t": ty.id};
  Navigator.of(ctx.context).pop(); // 关闭 Drawer

  // 切换类别，清除原列表
  ctx.dispatch(SrcHomeActionCreator.clearAction());

  pipe.get(ctx.state.st.httpsApi,
      params: ctx.state.getQueryParams(nextPage: false)).then(
          (response) {
        ctx.dispatch(SrcHomeActionCreator.initAction(response));
      }
  );
}

void _onKeyWord(Action action, Context<SrcHomeState> ctx){
  STPipe pipe = STPipe();

  // 切换类别，清除原列表
  ctx.dispatch(SrcHomeActionCreator.clearAction());

  pipe.get(ctx.state.st.httpsApi,
      params: ctx.state.getQueryParams(nextPage: false)).then(
          (response) {
        ctx.dispatch(SrcHomeActionCreator.initAction(response));
      }
  );
}
