import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(STEditState state, Dispatch dispatch, ViewService viewService) {

  return Scaffold(
    appBar: AppBar(
      title: Text("编辑/新增"),
    ),
    body: Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: state.titleController,
              focusNode: state.nameFocus,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: '标题:',

              ),
              autofocus: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: state.descController,
              focusNode: state.descFocus,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '描述:'
              ),
//              onChanged: (String str){
//                if(str != null && str.length > 0){
//                  state.rt.desc = str;
//                }
//              },
              autofocus: true,
            ),
          ),
//          Container(
//            padding: const EdgeInsets.all(16.0),
//            child: TextField(
//              controller: state.uriController,
//              focusNode: state.uriFocus,
//              decoration: InputDecoration(
//                  contentPadding: EdgeInsets.all(10.0),
//                  labelText: '地址:'
//              ),
////              onChanged: (String str){
////                if(str != null && str.length > 0){
////                  state.rt.uri = str;
////                }
////              },
//              autofocus: true,
//            ),
//          ),
//          Container(
//            padding: const EdgeInsets.all(16.0),
//            child: TextField(
//              controller: state.httpApiController,
//              focusNode: state.httpApiFocus,
//              decoration: InputDecoration(
//                  contentPadding: EdgeInsets.all(10.0),
//                  labelText: 'http api:'
//              ),
//              autofocus: true,
//            ),
//          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: state.httpsApiController,
              focusNode: state.httpsApiFocus,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: 'https api:'
              ),
//
              autofocus: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: OutlineButton(
                    child: const Text("确认"),
                    color: Theme.of(viewService.context).primaryColorDark,
                    onPressed: (){
                      /// 提交修改
                      /// TODO 判断是编辑还是新增
                      dispatch(STEditActionCreator.onSubmitAction());
                    },

                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
