import 'package:fish_redux/fish_redux.dart';

class DrawerState implements Cloneable<DrawerState> {

  @override
  DrawerState clone() {
    return DrawerState();
  }
}

DrawerState initState(Map<String, dynamic> args) {
  return DrawerState();
}
