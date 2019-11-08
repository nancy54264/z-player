import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

class STHomeState implements Cloneable<STHomeState> {

  List<STState> sts;

  @override
  STHomeState clone() {
    return STHomeState()
      ..sts = sts;
  }
}

STHomeState initState(Map<String, dynamic> args) {
  return STHomeState();
}
