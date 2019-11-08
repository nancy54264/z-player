import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:zplayer/global/application.dart';
import 'package:zplayer/global/static/themes.dart';
import 'package:zplayer/pages/app/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:zplayer/pages/app/state.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;


Effect<AppState> buildEffect() {
  return combineEffects(<Object, Effect<AppState>>{
    Lifecycle.initState: _init,
    Lifecycle.build: _build
//    HomeAction.action: _onAction,
  });
}

void _init(Action action, Context<AppState> ctx) {
  String theme = Application.localStorage.getString("theme");
  bool first = Application.localStorage.getBool("firstOpen");
  first??=true;
  AppState state = AppState()
    ..theme = ThemeStore.getTheme(theme)
    ..firstOpen = first
  ;

  ctx.dispatch(AppActionCreator.init(state));
}

void _build(Action action, Context<AppState> ctx) async{
  if(ctx.state.splash){
//    print("build");
    await Future.delayed(Duration(seconds: 2));
    ctx.dispatch(AppActionCreator.closeSplashAction());
  }else{
    /// [首次打开 App 提示]
    if(ctx.state.firstOpen){

      String _dialogContent = "本应用仅限学习交流之用！";
      BotToast.showWidget(toastBuilder: (cancelFunc){
       return CupertinoAlertDialog(
//         title: Text("提示"),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(20.0)
//        ),
         actions: <Widget>[
           CupertinoDialogAction(
             child: Text("已知晓"),
             onPressed: (){
               cancelFunc();
             },
           )
         ],
         content: SingleChildScrollView(
           child: ListBody(
             children: <Widget>[
               Container(
                 padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                 height: 35,
                 child: Text(
                   '声明',
                   style: TextStyle(
                     fontSize: 18.0,
                     fontWeight: FontWeight.w700
                   ),
                 ),
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     fit: BoxFit.fitWidth,
                     image: AssetImage('assets/images/trans_placeholder.png')
                   ),
                   borderRadius: BorderRadius.all(
                     Radius.circular(10.0),
                   )
                 ),
               ),
               SizedBox(height: 20.0),
               Text(
                 _dialogContent,
                style: TextStyle(
                  fontSize: 16.0
                ),)
             ],
           )
         ),
       );
     });

      Application.localStorage.putBool("firstOpen", false);
      ctx.dispatch(AppActionCreator.firstOpenAction());
    }
  }
}
