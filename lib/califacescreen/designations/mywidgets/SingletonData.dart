class IdSingleton {

  String id;
  String Url;

  static final IdSingleton _singleton = IdSingleton._internal();

  factory IdSingleton() {
    return _singleton;
  }

  IdSingleton._internal();
}