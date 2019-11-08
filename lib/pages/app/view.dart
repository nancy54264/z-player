import 'package:bot_toast/bot_toast.dart';
import 'package:zplayer/global/application.dart';
import 'package:zplayer/pages/drawer/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';


import 'action.dart';
import 'state.dart';



Widget buildView(AppState state, Dispatch dispatch, ViewService viewService) {
  List<Widget> pages = <Widget>[
    Application.routes.buildPage("home", null),
    Application.routes.buildPage("st_home", null),
//    HomePage().buildPage(null),
//    STHomePage().buildPage(null)
  ];

  var body = IndexedStack(
    children: pages,
    index: state.pageIndex,
  );

  print("Splash -> ${state.splash}");
  return BotToastInit(
    child: MaterialApp(
      navigatorObservers: [BotToastNavigatorObserver()],
      title: state.splash? "":"ZPlayer",
      theme: state.theme,
//    home: Application.routes.buildPage("home", null),
      home: state.splash? _buildSplash(): Scaffold(
        body: body,

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.video_call),
                title: Text("媒体")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                title: Text("资源")
            )
          ],
          currentIndex: state.pageIndex,
          selectedItemColor: Colors.grey,
          onTap: (int index){
            dispatch(AppActionCreator.changePageAction(index));
          },
        ),
        drawer: DrawerPage().buildPage(null),
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return Application.routes.buildPage(settings.name, settings.arguments);
        });
      },
    ),
  );
}

Widget _buildSplash(){
  // https://pixabay.com/zh/illustrations/berlin-german-germany-subway-train-4562893/
  // bmk2011 / Pixabay
  return Scaffold(
    body: Center(
      child: Image.asset("assets/images/splash_loading.png")
    ),
  );
}

