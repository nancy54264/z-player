import 'package:cached_network_image/cached_network_image.dart';
import 'package:zplayer/global/application.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

///  https://www.jianshu.com/p/d20bb417cd70 卡片布局参考
/// TODO 图片占位符和加载失败默认图

Widget buildView(SrcState state, Dispatch dispatch, ViewService viewService) {

  double padding = 10;
  double spacing = 10;
  int cols = 2;
  double ratio = 0.8;
  double w = Application.screen.width;
  double cw = (w - padding * 2 - spacing) / cols;
  double ch = cw / ratio;


  return Container(
    margin: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          blurRadius: 6,
          spreadRadius: 4,
          color: Color.fromARGB(20, 0, 0, 0),
        )
      ]
    ),
    alignment: Alignment.topLeft,

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
          renderImage(state, ch - 8 -70, dispatch),
          renderContent(state)
      ],
    )
  );
}

Widget renderImage(SrcState state, double h, Dispatch dispatch){

  return Stack(

    fit: StackFit.passthrough,
    children: <Widget>[
      InkWell(
        onTap: (){
          print("${state.name} -> click -> player");
          dispatch(SrcActionCreator.onPlayerAction());
        },
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8)
          ),

          child: CachedNetworkImage(
            imageUrl: state.pic,
            height: h,
//          placeholder: (context, url) => LinearProgressIndicator(),
            placeholder: (context, url) =>
                Image.asset("assets/images/image_placeholder.jpg", height: h),
            errorWidget: (contest, url, error) =>
                Image.asset("assets/images/image_placeholder.jpg"),
            fit: BoxFit.fill,
//          fadeInDuration: Duration(milliseconds: 0),
//          fadeOutDuration: Duration(milliseconds: 0),
          ),
        ),
      ),

      Positioned(
        left: 0,
        top: h,
        right: 0,
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(0, 0, 0, 0),
                Color.fromARGB(80, 0, 0, 0)
              ]

            )
          ),
        ),
      )
    ],
  );
}

Widget renderContent(SrcState state){
  return Container(
    margin: EdgeInsets.only(top: 5),
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 4),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Color(0xFFFFC600),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)
            ),
          ),
          child: Text(state.type, style:
          TextStyle(fontSize: 12, color: Colors.white),),
        ),
        Text(
          state.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333)
          ),
        ),
        Text(
          state.last,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey
          ),
        )
      ],
    ),
  );
}
