import 'package:zplayer/pages/home/rt_component/component.dart';
import 'package:zplayer/pages/home/rt_component/state.dart';
import 'package:zplayer/pages/home/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';


class RTListAdapter extends DynamicFlowAdapter<HomeState> {
  RTListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'rt': RTComponent()
          },
          connector: _RTListConnector(),
          reducer: buildReducer()
        );
}

class _RTListConnector extends ConnOp<HomeState, List<ItemBean>>
/// [https://github.com/alibaba/fish-redux/issues/482] #482
    with
    ReselectMixin<HomeState, List<ItemBean>>{

//  @override
//  List<ItemBean> get(HomeState state) {
//    return <ItemBean>[];
//  }

  @override
  void set(HomeState state, List<ItemBean> rts) {
    if(rts?.isNotEmpty == true){
      state.rts = List<RTState>.from(
        rts.map<RTState>((ItemBean bean) => bean.data).toList()
      );
    }else{
      state.rts = <RTState>[];
    }
  }

//  @override
//  subReducer(reducer) {
//    // TODO: implement subReducer
//    return super.subReducer(reducer);
//  }

  @override
  List<ItemBean> computed(HomeState state) {
    // TODO: implement computed
    if(state.rts?.isNotEmpty == true){
      return state.rts
          .map<ItemBean>((RTState data) => ItemBean("rt", data))
          .toList(growable: true);
    }
    return <ItemBean>[];
  }

  @override
  List factors(HomeState state) {
    // TODO: implement factors
    return <dynamic>[state.rts];
  }
}
