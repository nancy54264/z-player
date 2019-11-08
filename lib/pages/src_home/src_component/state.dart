import 'package:fish_redux/fish_redux.dart';
import '../pipe.dart';

class SrcState implements Cloneable<SrcState> {
  String last;
  String id;
  String tid;
  String name;
  String type;
  String pic;
  String lang;
  String area;
  String year;
  String state;
  String note;
  String actor;
  String director;
  List<DD> dl;
  String desc;

  SrcState({
    this.last,
    this.id,
    this.tid,
    this.name,
    this.type,
    this.pic,
    this.lang,
    this.area,
    this.year,
    this.state,
    this.note,
    this.actor,
    this.director,
    this.dl,
    this.desc
});

  @override
  SrcState clone() {
    return SrcState()
      ..last = last
      ..id = id
      ..tid = tid
      ..name = name
      ..type = type
      ..pic = pic
      ..lang = lang
      ..area = area
      ..year = year
      ..state = state
      ..note = note
      ..actor = actor
      ..director = director
      ..dl = dl
      ..desc = desc
    ;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Src{id:$id, tid:$tid, name:$name}";
  }
}

