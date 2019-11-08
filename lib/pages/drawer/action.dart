import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DrawerAction { action, toThemePage, navTo, nav }

class DrawerActionCreator {
  static Action onAction() {
    return const Action(DrawerAction.action);
  }

  static Action toThemePageAction(){
    return Action(DrawerAction.toThemePage);
  }

  static Action navTo(String page){
    return Action(DrawerAction.navTo, payload: page);
  }

//  static Action nav(String page){
//    return Action(DrawerAction.navTo, payload: page);
//  }
}
