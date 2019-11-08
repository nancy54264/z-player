import 'package:zplayer/global/application.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:zplayer/pages/src_home/pipe.dart';

/*
* Sliver 家族图谱
* https://blog.csdn.net/weixin_33910137/article/details/88027459
* */

// TODO 1. 播放列表控件 2. 列表显示控件 -> SliverGrid


Widget buildView(PlayerState state, Dispatch dispatch, ViewService viewService) {
  bool showVideo = Application.env.release ;

  Widget player(){
    return  IjkPlayer(
      mediaController: state.controller,
      controllerWidgetBuilder: (controller)=>
          DefaultIJKControllerWidget(
            controller: controller,
            doubleTapPlay: true,
            fullScreenType: FullScreenType.rotateScreen,
          ),

//      statusWidgetBuilder: _buildPlayerStatusWidget,
    );
  }

  double w =  Application.screen.width;
  double rx = 4 / 3;
  double h = w / rx;

  return Container(
    color: Colors.white,
    child: CustomScrollView(
      slivers: <Widget>[

        SliverAppBar(
          title: Text(
              state.isRt?state.rt.title:state.src.name,
          ),
          expandedHeight: h,
          flexibleSpace: showVideo?Container(
            child: player(),
          ): FlexibleSpaceBar(
            background: Image.asset("assets/images/video_placeholder.png", fit: BoxFit.cover,),
          ),
//          backgroundColor: ,
          floating: true,
          pinned: true,
          snap: false,
        ),

        /// Src Content
        SliverToBoxAdapter(
            child: buildSrcInfo(state),
        ),

        /// 播放列表
        state.isRt?SliverToBoxAdapter():SliverToBoxAdapter(
          child: Container(
//              height: 15,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(

              ),
              child: Text(
                "播放列表(${state.dl.length})",

                style: TextStyle(
                  fontSize: 16.0,
//                  color: ,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),
          ),
        ),

        state.isRt?
            SliverFillRemaining(
              child: null
            ): buildDDList(state, dispatch)
//        state.rt != null?buildRtSrcInfo(state): buildStSrcInfo(state),
      ],
    ),
  );
}

Widget buildSrcInfo(PlayerState state){


  return Container(
//      height: 60,
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      decoration: BoxDecoration(
//        color: Color(0xFFFFC600)
//        boxShadow: ,

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
            state.isRt?state.rt.title:state.src.name,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
              decoration: TextDecoration.none
//              decoration: TextDecoration(
//
//              )
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(padding: EdgeInsets.only(top: 6),),
          Text(
            state.isRt?state.rt.desc:state.src.desc,
            style: TextStyle(
              fontSize: 12.0,
              color: Color(0xFF999999),
              decoration: TextDecoration.none
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Divider(height: 1.0, color: Color.fromRGBO(196, 211, 214, 0.8),),
          )

//          separatorBuilder
        ],
      ),
    );
}


/// [分集列表]
Widget buildDDList(PlayerState state, Dispatch dispatch){

  return SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 4.0,
      childAspectRatio: 4,
    ),
    delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index){
          DD d = state.dl[index];
          return GestureDetector(
            onTap: () => dispatch(PlayerActionCreator.onSelectEpisodeAction(d)),
            child: Container(

              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                border: Border.all(
                    width: 0.5,
                    color: state.d.src == d.src?Colors.redAccent:Colors.black
                ),
              ),
              child: Center(
                  child: Text(
                    d.name,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      color: state.d.src == d.src?Colors.redAccent:Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
              ),
            ),
          );
        },
      childCount: state.dl.length
    ),

  );
}


