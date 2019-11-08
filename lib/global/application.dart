import 'dart:developer';

import '../global/store/state.dart';
import '../global/store/reducer.dart';
import '../pages/app/page.dart';
import '../pages/player/page.dart';
import '../pages/rt_edit/page.dart';
import '../pages/src_home/page.dart';
import '../pages/st_edit/page.dart';
import '../pages/st_list/page.dart';
import 'package:fish_redux/fish_redux.dart';
import '../pages/home/page.dart';
import '../pages/theme/page.dart';
import '../utils/local_storage.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'dart:ui';

class Screen{

  double width;
  double height;

  Screen({this.width, this.height});

}


class Environment{
  bool release;
  bool debug;

  Environment(){
    release = bool.fromEnvironment("dart.vm.product");
    debug = !release;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Env{release: $release, debug: $debug";
  }

}



class Application{

  static Store<GlobalState> _store;
  static MediaQueryData _media = MediaQueryData.fromWindow(window);
  static Screen screen = Screen(width: _media.size.width, height: _media.size.height);
  static LocalStorage localStorage;
  static Environment env = Environment();

  static final AbstractRoutes _routes = PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'home': HomePage(),
        'theme': ThemePage(),
        'main': AppPage(),
        'rt_edit': RTEditPage(),
        'st_home': STHomePage(),
        'st_edit': STEditPage(),
        'src_home': SrcHomePage(),
        'player': PlayerPage()
      },
      visitor: (String path, Page<Object, dynamic> page){
        /// 建立特定 Page 到全局 Store 的单向连接
        if(page.isTypeof<GlobalBaseState>()){
          page.connectExtraStore(Application.store,
               (Object pageState, GlobalState globalState){
                  final GlobalBaseState p = pageState;
                  if(p.theme != globalState.theme && pageState is Cloneable){
                    final Object copy = pageState.clone();
                    final GlobalBaseState newState = copy;
                    newState.theme = globalState.theme;
                    return newState;
                  }
                  return pageState;
          });
        }


        page.enhancer.append(
          /// View AOP
            viewMiddleware: <ViewMiddleware<dynamic>>[
              safetyView<dynamic>()
            ],

            /// Adapter AOP
            adapterMiddleware: <AdapterMiddleware<dynamic>>[
              safetyAdapter<dynamic>()
            ],

            /// Effect AOP
            effectMiddleware: <EffectMiddleware<dynamic>>[
              _pageAnalyticsMiddleware<dynamic>()
            ],

            /// Store AOP
            middleware: <Middleware<dynamic>>[
              logMiddleware<dynamic>(tag: page.runtimeType.toString())
            ]

        );
      }

  );


  static AbstractRoutes get routes => _routes;
  static Store<GlobalState> get store =>
      _store??=createStore<GlobalState>(GlobalState(), buildReducer());

//  static double get width => _media.size.width;
//
//  static double get height => _media.size.height;

}

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}