
import 'package:zplayer/global/store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';


class AppState implements GlobalBaseState, Cloneable<AppState> {

  int pageIndex;
  bool splash;
  bool firstOpen;

  @override
  AppState clone() {
    return AppState()
      ..pageIndex = pageIndex
      ..theme = theme
      ..splash = splash
      ..firstOpen = firstOpen
    ;
  }

  @override
  ThemeData theme;
}

AppState initState(Map<String, dynamic> args) {

  return AppState()
    ..pageIndex=0
    ..splash = true
    ..firstOpen = false
  ;
}
