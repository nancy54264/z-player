import 'package:zplayer/global/common/db_provider.dart';
import 'package:zplayer/utils/sql.dart';
import 'package:fish_redux/fish_redux.dart';

class RTState implements Cloneable<RTState>, DataModel<RTState> {

  int id;
  String title;
  String uri;
  String desc;
  int order;

  bool lock;
  /// 可能需要的字段
  /// 序号，背景颜色...
//  String order;
  // Color

  RTState({this.id, this.title, this.desc, this.uri, this.order, this.lock}){
    lock ??= false;
  }

  @override
  RTState clone() {
    return RTState()
      ..id = id
      ..title = title
      ..desc = desc
      ..uri = uri
      ..order = order
      ..lock = lock;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "RT{id: $id, title: $title, uri: $uri, desc: $desc, order: $order}";
  }

  factory RTState.from(Map<String, dynamic> map){
    return RTState(
        id: map['id'],
        title: map['title'],
        desc: map['desc'],
        uri: map['uri'],
        order: map['ord']
    );
  }

  @override
  Future<int> delete() async{
    if(id == null){
      return 0;
    }
    return await Sql.setTable("rts").delete(id.toString(), "id");
  }

  @override
  Future<RTState> insert() async{
    RTState state = RTState.from(
        await Sql.setTable("rts").insert(toMap()..remove("id"))
    );
    state.order = state.id;
    return state;
  }

  @override
  Future<RTState> update() async{

    return RTState.from(await Sql.setTable("rts").update(toMap()));
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    return {
      "id": id,
      "title": title,
      "desc": desc,
      "uri": uri,
      "ord": order
    };
  }

  Future<RTState> top() async{
    int oldOrder = order;
    this.order = 0;
    RTState rt =  await this.update();
    await Sql.setTable('rts').execute("update rts set ord = ord +1 where ord < $oldOrder");
    return rt;
  }
}

