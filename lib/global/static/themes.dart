import 'package:flutter/material.dart';

class Theme{
  final Map<String, Color> _series = {
    "pink": Color.fromRGBO(246, 200, 200, 1),
    "default": Color.fromRGBO(246, 200, 200, 1),
    "coffee": Color.fromRGBO(228, 183, 160, 1),
    "dark": Colors.grey,
    "cyan": Color.fromRGBO(143, 227, 235, 1),
    "purple": Color.fromRGBO(205, 188, 255, 1),
    "green": Color.fromRGBO(151, 215, 178, 1),
    "blueGray": Color.fromRGBO(135, 170, 171, 1)
  };
  String name;

  Theme(this.name);



  ThemeData getThemeData(){
    Color color = _series[name];
    if(name == "dark"){
      return ThemeData(
        brightness: Brightness.dark,
        appBarTheme: _getAppBarTheme(Colors.grey[800], Colors.grey),
        scaffoldBackgroundColor: Colors.grey[800]
      );
    }

    return ThemeData(
      primaryColor: color,
      primaryColorDark: _getDarkColor(color),
      primaryColorLight: _getLightColor(color),
      appBarTheme: _getAppBarTheme(color, Colors.white)
    );
  }

  Color _getDarkColor(Color color) {
    int number = 20;
    int red = color.red - number <= 0 ? color.red : color.red - number;
    int green = color.green - number <= 0 ? color.green : color.green - number;
    int blue = color.blue - number <= 0 ? color.blue : color.blue - number;
    return Color.fromRGBO(red, green, blue, 1);
  }

  Color _getLightColor(Color color) {
    int number = 30;
    int red = color.red + number >= 255 ? color.red : color.red + number;
    int green =
    color.green + number >= 255 ? color.green : color.green + number;
    int blue = color.blue + number >= 255 ? color.blue : color.blue + number;
    return Color.fromRGBO(red, green, blue, 1);
  }

  AppBarTheme _getAppBarTheme(Color bgColor, Color iconColor) {
    return AppBarTheme(
      iconTheme: IconThemeData(color: iconColor),
      color: bgColor,
      elevation: 0.0,
      textTheme: TextTheme(
        title: TextStyle(color: iconColor, fontSize: 20),
      ),
    );
  }

}

//enum ThemeSeries{
//  dark, pink, coffee, cyan, purple, green, blueGray
//}

class ThemeSeries{
  static const String dark = "dark";
  static const String pink = "pink";
  static const String coffee = "coffee";
  static const String cyan = "cyan";
  static const String purple = "purple";
  static const String green = "green";
  static const String blueGray = "blueGray";
}




class ThemeStore{

  static final ThemeData darkTheme = Theme("dark").getThemeData();
  static final ThemeData pinkTheme = Theme("pink").getThemeData();
  static final ThemeData defaultTheme = Theme("default").getThemeData();
  static final ThemeData coffeeTheme = Theme("coffee").getThemeData();
  static final ThemeData cyanTheme = Theme("cyan").getThemeData();
  static final ThemeData purpleTheme = Theme("purple").getThemeData();
  static final ThemeData greenTheme = Theme("green").getThemeData();
  static final ThemeData blueGrayTheme = Theme("blueGray").getThemeData();

  static ThemeData getTheme(String series){
    switch (series){
      case ThemeSeries.dark:
        return darkTheme;
      case ThemeSeries.pink:
        return pinkTheme;
      case ThemeSeries.coffee:
        return coffeeTheme;
      case ThemeSeries.cyan:
        return cyanTheme;
      case ThemeSeries.purple:
        return purpleTheme;
      case ThemeSeries.green:
        return greenTheme;
      case ThemeSeries.blueGray:
        return blueGrayTheme;
      default:
        return defaultTheme;
        break;
    }
  }


}
