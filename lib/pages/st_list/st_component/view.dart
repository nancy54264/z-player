import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(STState state, Dispatch dispatch, ViewService viewService) {
  List<Widget> rightSlide = <Widget>[
    IconSlideAction(
//      caption: "置顶",
      color: Colors.grey.shade200,
      icon: Icons.arrow_upward,
      onTap: (){
        dispatch(STActionCreator.onTopAction(state.order));
      },
    ),
  ];

  List<Widget> leftSlide = <Widget>[
    IconSlideAction(
      color: Colors.green.shade300,
      icon: Icons.edit,
      onTap: (){
        /// 编辑
        dispatch(STActionCreator.onEditAction(state.id));
      },
    ),

    IconSlideAction(
//      caption: "删除",
      color: Colors.red.shade300,
      icon: Icons.close,
      onTap: (){
        dispatch(STActionCreator.onRemoveAction(state.id));
      },
    )
  ];

  return Slidable(
    key: ValueKey(state.id),
    actionPane: SlidableScrollActionPane(),
    actions: state.lock?null:rightSlide,
    secondaryActions: state.lock?null:leftSlide,
    child: ListTile(
      title: state.lock?Icon(Icons.add):Text(state.title),
      onTap: (){
        if(state.lock){
          dispatch(STActionCreator.onAddAction());
        }else{
          dispatch(STActionCreator.onClickAction());
          print("click item -> menu ");
        }
      },
    ),
  );
}
