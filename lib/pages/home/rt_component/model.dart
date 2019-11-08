import 'state.dart';
class RT{
  static String table = "rts";
  int id;
  String title;
  String desc;
  String uri;
  int order;

  RT({this.id, this.title, this.desc, this.uri, this.order});

  factory RT.from(RTState state){
    return RT();
  }




}