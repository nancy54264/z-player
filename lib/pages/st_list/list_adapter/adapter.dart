import 'package:zplayer/pages/st_list/list_adapter/reducer.dart';
import 'package:zplayer/pages/st_list/st_component/component.dart';
import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:zplayer/pages/st_list/state.dart';
import 'package:fish_redux/fish_redux.dart';

class STListAdapter extends DynamicFlowAdapter<STHomeState> {
  STListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'st': STComponent()
          },
          connector: _STListConnector(),
          reducer: buildReducer()
          );
}

class _STListConnector extends ConnOp<STHomeState, List<ItemBean>>
    with ReselectMixin<STHomeState, List<ItemBean>>{

  @override
  void set(STHomeState state, List<ItemBean> sts) {
    if(sts?.isNotEmpty == true){
      state.sts = List<STState>.from(
        sts.map<STState>((ItemBean bean) => bean.data).toList()
      );
    }else{
      state.sts = <STState>[];
    }
  }

//  @override
//  subReducer(reducer) {
//    // TODO: implement subReducer
//    return super.subReducer(reducer);
//  }

  @override
  List<ItemBean> computed(STHomeState state) {
    if(state.sts?.isNotEmpty == true){
      return state.sts
          .map<ItemBean>((STState data) => ItemBean("st", data))
          .toList(growable: true);
    }
    return <ItemBean>[];
  }

  @override
  List factors(STHomeState state) {
    // TODO: implement factors
    return <dynamic>[state.sts];
  }
}
