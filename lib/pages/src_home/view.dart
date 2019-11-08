import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';

import 'action.dart';
import 'state.dart';
import 'pipe.dart';

/// TODO 1. 关键词检索 2. 类别筛选 3. 搜索历史？
/// TODO 避免重复刷新(加锁？)
/// TODO 异常处理


Widget buildView(SrcHomeState state, Dispatch dispatch, ViewService viewService) {

  return Scaffold(
    drawer: buildDrawer(state, dispatch),
    body: Container(
      child: EasyRefresh.custom(
        footer: BallPulseFooter(),
        onLoad: () async {
          dispatch(SrcHomeActionCreator.onLoadAction());
        },
        slivers: <Widget>[
          /*https://www.codercto.com/a/34161.html*/
          SliverAppBar(
            title: TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 4),
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              style: TextStyle(fontSize: 14),
              onSubmitted: (str){
                dispatch(SrcHomeActionCreator.onKeyWord());
              },
              controller: state.keyWordController,
              focusNode: state.keyWordFocus,
            ),
            actions: <Widget>[

            ],
            expandedHeight: 40.0,
//            floating: true,
//            snap: true,
            pinned: true,
            automaticallyImplyLeading: false,

          ),
          buildSliverBody(state, dispatch, viewService)
          /*SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 4.0,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
              adapter.itemBuilder,
              childCount: adapter.itemCount
            ),
          )*/
        ],
      ),
    )
  );
}

/// [菜单列表]
/// TODO 待优化UI
Widget buildDrawer(SrcHomeState state, Dispatch dispatch){
  return state.loading?null: Drawer(
    child: ListView.builder(
      itemBuilder: (BuildContext context, int index){
        Ty ty = state.tys[index];
        return ListTile(
          leading: Text(
            "$index",
            style: TextStyle(
              fontSize: 16.0,
              color: ty.id == state.t.id? Colors.redAccent:Colors.grey,
            ),
          ),
          title: Text(
            ty.t,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: ty.id == state.t.id? Colors.redAccent:Colors.grey,
            ),
          ),
          onTap: (){
            dispatch(SrcHomeActionCreator.onSelectTypeAction(ty));
            print("switch ty -> ${ty.id}");
          },
        );
      },
      itemCount: state.tys.length,
//        separatorBuilder: (BuildContext context, int index) {
//          return Divider(color: Colors.grey);
//        },
    ),
  );
}

/// [资源列表]
/// TODO 待优化
Widget buildSliverBody(SrcHomeState state, Dispatch dispatch, ViewService viewService){
  final ListAdapter adapter = viewService.buildAdapter();
  if(state.loading){
    return SliverFillRemaining(
      child: Center(
        child: Text("loading...")
      ),
    );
  }

  if(state.srcList.length < 1){
    return SliverFillRemaining(
      child: Center(
        child: Text("暂无资源!"),
      ),
    );
  }

  return SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 4.0,
      childAspectRatio: 0.8,
    ),
    delegate: SliverChildBuilderDelegate(
        adapter.itemBuilder,
        childCount: adapter.itemCount
    ),
  );
}

