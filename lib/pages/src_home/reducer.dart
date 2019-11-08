import 'package:zplayer/pages/src_home/src_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';
import 'pipe.dart';

Reducer<SrcHomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<SrcHomeState>>{
      SrcHomeAction.init: _init,
      SrcHomeAction.load: _load,
      SrcHomeAction.clear: _clear
    },
  );
}

SrcHomeState _init(SrcHomeState state, Action action) {
  PageResponse res = action.payload;
  Ty all = Ty(id: "0", t:"全部");
  List<Ty> tys = <Ty>[];
  tys.add(all);
  tys.addAll(res.tys);
  final SrcHomeState newState = state.clone()
    ..t = res.t
    ..page = res.page
    ..pageCount = res.pageCount
    ..pageSize = res.pageSize
    ..recordCount = res.recordCount
    ..tys = tys
    ..srcList = res.srcList
  ;
  newState.loading = false;
  return newState;
}

SrcHomeState _load(SrcHomeState state, Action action){
  PageResponse res = action.payload;

  SrcHomeState newState = state.clone()
    ..page = res.page
    ..srcList = (state.srcList.toList()..addAll(res.srcList))
  ;
//  newState.srcList.addAll(res.srcList);

  return newState;
}

SrcHomeState _clear(SrcHomeState state, Action action){
  return state.clone()
    ..loading = false
    ..srcList = <SrcState>[];
  ;
}

