import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

final TextStyle _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w300);

Widget buildView(DrawerState state, Dispatch dispatch, ViewService viewService) {
  return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text('', style: TextStyle(fontSize: 28)),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage("assets/images/panda-trans-500.png"),
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.toys, size: 27.0),
            title: Text('主题', style: _textStyle),
            onTap: () => dispatch(DrawerActionCreator.navTo("theme")),
          ),
          Divider(),
        ],
      )
  );
}
