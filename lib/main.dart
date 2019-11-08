import 'package:zplayer/global/application.dart';
import 'package:zplayer/utils/local_storage.dart';
import 'package:zplayer/utils/provider.dart';
import 'package:flutter/material.dart' hide Action;

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Provider provider = Provider();
  await provider.init(false);
  LocalStorage ls = await LocalStorage.getInstance();
  Application.localStorage = ls;
//  Application
  runApp(createApp());
}


Widget createApp(){

  return Application.routes.buildPage("main", null);
}

