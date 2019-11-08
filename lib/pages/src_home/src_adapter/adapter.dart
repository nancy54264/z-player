import 'package:zplayer/pages/src_home/src_component/component.dart';
import 'package:zplayer/pages/src_home/src_component/state.dart';
import 'package:zplayer/pages/src_home/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';


class SrcListAdapter extends DynamicFlowAdapter<SrcHomeState> {
  SrcListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'src': SrcComponent()
          },
          connector: _SrcListConnector(),
          reducer: buildReducer(),
        );
}

class _SrcListConnector extends ConnOp<SrcHomeState, List<ItemBean>>
    with
        ReselectMixin<SrcHomeState, List<ItemBean>> {

  @override
  List<ItemBean> computed(SrcHomeState state) {
    if(state.srcList?.isNotEmpty == true){
      return state.srcList
          .map<ItemBean>((SrcState data) => ItemBean("src", data))
          .toList(growable: true);
    }
    return <ItemBean>[];
  }

  @override
  void set(SrcHomeState state, List<ItemBean> srcList) {
    if(srcList?.isNotEmpty == true){
      state.srcList = List<SrcState>.from(
        srcList.map<SrcState>((ItemBean bean) => bean.data).toList()
      );
    }else{
      state.srcList = <SrcState>[];
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }

//  @override
//  List<ItemBean> computed(SrcHomeState state) {
//    // TODO: implement computed
//    return null;
//  }

  @override
  List factors(SrcHomeState state) {
    // TODO: implement factors
    return <dynamic>[state.srcList];
  }
}
