import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';
import 'src_component/state.dart';
/*
    "httpApi": "http://cj.okzy.tv/inc/apickm3u8.php",
    "httpsApi": "http://cj.okzy.tv/inc/apickm3u8s.php",
* */

class BaseApi{
  Dio dio = new Dio();
}

class PageResponse{
  Ty t;
  String page;
  String pageCount;
  String pageSize;
  String recordCount;
  List<Ty> tys;
  List<String> ids;
  List<SrcState> srcList;

  PageResponse({
    this.page, this.pageCount, this.pageSize, this.recordCount, this.tys,
    this.ids, this.srcList, this.t
  });

  @override
  String toString() {
    // TODO: implement toString
    return "RTS{page:$page, ids: $ids}";
  }



}


class Ty{
  String id;
  String t;
  Ty({this.id, this.t});

  @override
  String toString() {
    // TODO: implement toString
    return "Ty{id:$id, t: $t}";
  }
}


class DD{
  String flag;
  String name;
  String src;

  DD({this.flag, this.name, this.src});

  @override
  String toString() {
    // TODO: implement toString
    return "DD{flag:$flag, name: $name, data: $src}";
  }
}


class STPipe{
  final Xml2Json xmlParse = Xml2Json();
  /// 1. apiInfo -> class -> page1
  ///
  ///
  Future<PageResponse> get(String api, {Map<String, String> params}) async{
    /*
    * {
    *   page: 1
    *   pageCount: 1000,
    *   pageSize: 30
    *   recordCount: 30000,
    *   classes: [
    *     Ty
    *   ]
    * }
    * */
    PageResponse rtr = PageResponse();
    String t;
    if(params != null && params.containsKey("t")){
      t = params['t'];
    }else{
      rtr.t = Ty(id: "0", t:"全部");
    }

    Response res = await STApi.setApi(api).list(params: params);
    xmlParse.parse(res.data);
    String jsonStr = xmlParse.toGData();
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    List<String> ids = <String>[];
    try{
      jsonMap['rss']['list']['video'].forEach(
              (e) => ids.add(e['id']['\$t'])
      );
    }on Error{
      print("Src Pipe parse -> video not exist!");
    }on Exception{
      print("Src Pipe parse -> video not exist!");
    }

    List<Ty> tys = jsonMap['rss']['class']['ty']
        .map<Ty>((e) => Ty(id:e['id'], t: e['\$t'])).toList();
    rtr
      ..page = jsonMap['rss']['list']['page']
      ..pageCount = jsonMap['rss']['list']['pagecount']
      ..pageSize = jsonMap['rss']['list']['pagesize']
      ..recordCount = jsonMap['rss']['list']['recordcount']
      ..tys = tys
      ..ids = ids
    ;

    if(t != null){
      rtr.t = tys.firstWhere((e) => e.id == t);
    }
    if(rtr.ids.isEmpty){
      rtr.srcList = <SrcState>[];
      return rtr;
    }


    Map<String, String> detailParams = {
      "ids": ids.join(",")
    };
    List<SrcState> vl = await srcList(api, params:detailParams);
    rtr.srcList = vl;

    return rtr;
  }

  Future<List<SrcState>> srcList(String api, {Map<String, String> params}) async{
    Response res = await STApi.setApi(api).detail(params: params);

    xmlParse.parse(res.data);
//    print(xmlParse.toGData());
    String jsonStr = xmlParse.toGData();
//    print(jsonStr);
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    List<SrcState> videos = <SrcState>[];
    jsonMap['rss']['list']['video'].forEach(
            (e) => videos.add(parseSrc(e))
    );

    return videos;
  }

  SrcState parseSrc(dynamic e){
    /// dd
    var dls = e['dl']['dd'];
    if(dls is List){

    }else{
      dls = [
        {
          "flag": dls['flag'],
          "__cdata": dls['__cdata']
        }
      ];
    }
    List<DD> dds = <DD>[];
    for (var d in dls) {
      var dl = d['__cdata'];
      var flag = d['flag'];
      List<DD> ds = dl.split("#").toList().map<DD>(
              (e) => DD()
            ..flag = flag
            ..name = e.split("\$")[0]
            ..src = e.split("\$")[1]
      ).toList();
      dds.addAll(ds);
    }


    return SrcState()
      ..last = e['last']['\$t']
      ..id = e['id']['\$t']
      ..tid = e['tid']['\$t']
      ..name = e['name']['__cdata']
      ..type = e['type']['\$t']
      ..pic = e['pic']['\$t']
      ..lang = e['lang']['\$t']
      ..area = e['area']['\$t']
      ..year = e['year']['\$t']
      ..state = e['state']['\$t']
      ..note = e['note']['__cdata']
      ..actor = e['actor']['__cdata']
      ..director = e['director']['__cdata']
      ..dl = dds
      ..desc = e['des']['__cdata']

    ;
  }

}


class STApi extends BaseApi{

  String url;

  STApi.setApi(String url): url = url;

  Future<Response> list({Map<String, String> params}) async{
    /// {pg: currentPage, t: currentClass, wd: keyWord}
    ///
    var defaultParams = {
      "ac": 'list',
      "pg": '1'
    };
    if(params!=null){
      defaultParams.addAll(params);
    }

    Response response;
    try {
      print("Src Pipe List -> url :$url -> params -> $defaultParams");
      response = await dio.get(url, queryParameters: defaultParams);
      return response;
    } on Exception catch (e){
//      print(e);
      throw "";
    }
  }

  Future<Response> detail({Map<String, String> params}) async{
    Map<String, String> defaultParams = {
      "ac": "videolist"
    };
    defaultParams.addAll(params);
    Response response;
    try {
      print("Src Pipe Detail -> url :$url -> params -> $defaultParams");
      response = await dio.get(url, queryParameters: defaultParams);
      return response;
    } on Exception catch (e){
//       print(e);
      throw "";
    }

  }

}