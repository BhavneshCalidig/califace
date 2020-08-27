class CameraSingleton {

  String id;


  static final CameraSingleton _singleton = CameraSingleton._internal();

  factory CameraSingleton() {
    return _singleton;
  }

  CameraSingleton._internal();
}