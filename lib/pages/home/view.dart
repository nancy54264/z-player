//import 'package:zplayer/global/application.dart';
//import 'package:zplayer/pages/drawer/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

//import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text("媒体"),
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemBuilder: adapter.itemBuilder,
                itemCount: adapter.itemCount,
            ),
          ),
        ],
      ),
    )
  );
}
