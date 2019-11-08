import 'package:zplayer/pages/src_home/src_component/state.dart';
import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'pipe.dart';



class SrcHomeState implements Cloneable<SrcHomeState> {

  STState st;

  /*类型*/
  List<Ty> tys;  // 类型列表
  List<SrcState> srcList; // video list
  Ty t; // 当前类型
  String page;
  String pageCount;
  String pageSize;
  String recordCount;
  bool loading = true;

  TextEditingController keyWordController;
  FocusNode keyWordFocus;



  @override
  SrcHomeState clone() {
    return SrcHomeState()
      ..st = st
      ..tys = tys
      ..srcList = srcList
      ..t = t
      ..page = page
      ..pageSize = pageSize
      ..pageCount = pageCount
      ..recordCount = recordCount
      ..loading = loading
      ..keyWordController = keyWordController
      ..keyWordFocus = keyWordFocus
    ;
  }

  Map<String, String> getQueryParams({bool nextPage}){
    var params = {
      "pg": nextPage? (int.parse(page) + 1).toString(): "1",
      "t": t.id,
      "wd": keyWordController.text.trim()
    };
    if(t.id == "0"){
      params.remove("t");
    }

    if(keyWordController.text.trim().length < 1){
      params.remove("wd");
    }

    return params;
  }
}

SrcHomeState initState(STState st){
  /// init
//
//  STPipe pipe = STPipe();
//  await pipe.get(st.httpsApi, params: {"pg":1, "t":"1"});
//

  return SrcHomeState()
    ..st = st
    ..keyWordController = TextEditingController()
    ..keyWordFocus = FocusNode()
  ;
}
