import 'package:zplayer/global/application.dart';
import 'package:zplayer/global/static/themes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

class ThemeBean{
  String series;
  String name;
  Color color;

  ThemeBean(this.series, this.name, this.color);
}

Widget buildView(ThemeState state, Dispatch dispatch, ViewService viewService) {
  /// 可选的主题列表
  List<ThemeBean> themeList = [
    ThemeBean(ThemeSeries.dark, "夜晚模式", Colors.black),
    ThemeBean(ThemeSeries.pink, "粉色", Colors.pink),
    ThemeBean(ThemeSeries.green, "绿色", Colors.green),
    ThemeBean(ThemeSeries.blueGray, "蓝灰色", Colors.blueGrey),
    ThemeBean(ThemeSeries.cyan, "蓝绿色", Colors.cyan),
    ThemeBean(ThemeSeries.coffee, "咖啡色", Color.fromRGBO(228, 183, 160, 1)),
    ThemeBean(ThemeSeries.purple, "紫色", Colors.purple),

  ];

  /// 分割线
  Widget divider = Divider(color: Colors.grey);


  return Scaffold(
    appBar: AppBar(
      title: Text("切换主题"),
      backgroundColor: state.theme?.primaryColor,
    ),
    body: ListView.separated(
        itemBuilder: (BuildContext context, int index){
          ThemeBean bean = themeList[index];
          return ListTile(
            leading: Icon(
              Icons.bookmark,
              color: bean.color,
            ),
            title: Text(bean.name),
            onTap: (){
//              print("hello ");
              dispatch(ThemeActionCreator.onChangeTheme(bean.series));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return divider;
        },
        itemCount: themeList.length)
  );
}
