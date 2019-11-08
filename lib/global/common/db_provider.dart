abstract class DataModel<T extends DataModel<T>>{

  Future<T> insert();

  Future<T> update();

  Future<int> delete();

  Map<String, dynamic> toMap();

}

abstract class ModelList{

  Future<List<dynamic>> list;

}