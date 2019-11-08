import 'package:zplayer/pages/home/rt_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

class HomeState implements Cloneable<HomeState> {
  List<RTState> rts;


  @override
  HomeState clone() {
    return HomeState()
      ..rts = rts;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
