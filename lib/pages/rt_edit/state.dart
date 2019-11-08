import 'package:zplayer/pages/home/rt_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';


class RTEditState implements Cloneable<RTEditState> {
  RTState rt;

  TextEditingController titleController;
  TextEditingController descController;
  TextEditingController uriController;

  FocusNode nameFocus;
  FocusNode descFocus;
  FocusNode uriFocus;


  @override
  RTEditState clone() {
    return RTEditState()
      ..rt = rt
      ..titleController = titleController
      ..descController = descController
      ..uriController = uriController
      ..nameFocus = nameFocus
      ..descFocus = descFocus
      ..uriFocus = uriFocus;
  }
}

RTEditState initState(RTState args) {
  final RTEditState state = RTEditState();
  state.rt = args?.clone() ?? RTState();
  print("IsAdd : ${state.rt}");
  state.titleController = TextEditingController(text: args?.title);
  state.descController = TextEditingController(text: args?.desc);
  state.uriController = TextEditingController(text: args?.uri);

  state.nameFocus = FocusNode();
  state.descFocus = FocusNode();
  state.uriFocus = FocusNode();

  return state;
}
