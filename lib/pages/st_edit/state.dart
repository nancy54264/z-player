import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class STEditState implements Cloneable<STEditState> {

  STState st;

  TextEditingController titleController;
  TextEditingController descController;
//  TextEditingController uriController;
//  TextEditingController httpApiController;
  TextEditingController httpsApiController;

  FocusNode nameFocus;
  FocusNode descFocus;
//  FocusNode uriFocus;
//  FocusNode httpApiFocus;
  FocusNode httpsApiFocus;

  @override
  STEditState clone() {
    return STEditState()
      ..st = st
      ..titleController = titleController
      ..descController = descController
//      ..uriController = uriController
//      ..httpApiController = httpApiController
      ..httpsApiController = httpsApiController
      ..nameFocus = nameFocus
      ..descFocus = descFocus
//      ..uriFocus = uriFocus
//      ..httpApiFocus = httpApiFocus
      ..httpsApiFocus = httpsApiFocus
    ;
  }
}

STEditState initState(STState args) {

  final STEditState state = STEditState();
  state.st = args?.clone() ?? STState();
  state.titleController = TextEditingController(text: args?.title);
  state.descController = TextEditingController(text: args?.desc);
//  state.uriController = TextEditingController(text: args?.uri);
//  state.httpApiController = TextEditingController(text: args?.httpApi);
  state.httpsApiController = TextEditingController(text: args?.httpsApi);

  state.nameFocus = FocusNode();
  state.descFocus = FocusNode();
//  state.uriFocus = FocusNode();
//  state.httpApiFocus = FocusNode();
  state.httpsApiFocus = FocusNode();

  return state;
}
