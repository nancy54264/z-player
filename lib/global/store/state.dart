import '../static/themes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

abstract class GlobalBaseState{
  ThemeData get theme;
  set theme(ThemeData themeData);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  // 全局状态维护
  @override
  ThemeData theme;

  @override
  GlobalState clone() {
    return GlobalState()
      ..theme = theme;
  }
}

GlobalState initState(Map<String, dynamic> args) {
  return GlobalState()..theme = ThemeStore.blueGrayTheme;
}
