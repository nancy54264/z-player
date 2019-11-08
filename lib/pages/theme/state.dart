import 'package:zplayer/global/store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' show ThemeData;

class ThemeState implements GlobalBaseState, Cloneable<ThemeState> {

  @override
  ThemeState clone() {
    return ThemeState()
      ..theme = theme;
  }

  @override
  ThemeData theme;
}

ThemeState initState(Map<String, dynamic> args) {
  return ThemeState();
}
