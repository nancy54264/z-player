import 'package:zplayer/global/common/db_provider.dart';
import 'package:zplayer/utils/sql.dart';
import 'package:fish_redux/fish_redux.dart';

class STState implements Cloneable<STState>, DataModel<STState> {
/*
* "id": "43231f58-8361-4188-816d-f204562444ab",
    "name": "ok资源网站",
    "uri": "http://www.jisudhw.com",
    "httpApi": "http://cj.okzy.tv/inc/apickm3u8.php",
    "httpsApi": "http://cj.okzy.tv/inc/apickm3u8s.php",
    "type": "影视"
* */
  int id;
  String title;
//  String uri;
//  String httpApi;
  String httpsApi;
  String desc;
  int order;

  bool lock;

  STState({this.id, this.title, this.desc,
    this.order, this.httpsApi, this.lock}){
    lock??=false;
  }

  @override
  STState clone() {
    return STState()
      ..id = id
      ..title = title
      ..desc = desc
//      ..uri = uri
      ..order = order
      ..lock = lock
//      ..httpApi = httpApi
      ..httpsApi = httpsApi
      ;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "ST{id: $id, title: $title, order: $order}";
  }

  factory STState.from(Map<String, dynamic> map){
    return STState(
      id: map['id'],
      title: map['title'],
      desc: map['desc'],
//      uri: map['uri'],
      order: map['ord'],
//      httpApi: map['http_api'],
      httpsApi: map['https_api']
    );
  }

  @override
  Future<int> delete() async{
    if(id == null){
      return 0;
    }
    // TODO: implement delete
    return await Sql.setTable('sts').delete(id.toString(), "id");
  }

  @override
  Future<STState> insert() async{
    STState state = STState.from(
      await Sql.setTable("sts").insert(toMap()..remove("id"))
    );
    state.order = state.id;
    return state;
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    return {
      "id": id,
      "title": title,
      "desc": desc,
//      "uri": uri,
      "ord": order,
//      "http_api": httpApi,
      "https_api": httpsApi
    };
  }

  @override
  Future<STState> update() async{

    return STState.from(await Sql.setTable("sts").update(toMap()));
  }

  Future<STState> top() async{
    int oldOrder = order;
    this.order = 0;
    STState st = await update();
    await Sql.setTable("sts").execute("update sts set ord = ord +1 where ord < $oldOrder");
    return st;
  }
}

