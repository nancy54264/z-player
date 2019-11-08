import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter/material.dart' hide Action;

Effect<SrcState> buildEffect() {
  return combineEffects(<Object, Effect<SrcState>>{
    SrcAction.action: _onAction,
    SrcAction.onPlayer: _onPlayer
  });
}

void _onAction(Action action, Context<SrcState> ctx) {
}

void _onPlayer(Action action, Context<SrcState> ctx){
  Navigator.of(ctx.context).pushNamed("player", arguments: ctx.state);
}
