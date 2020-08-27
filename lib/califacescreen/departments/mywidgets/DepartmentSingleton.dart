class DepartmentSingleton {

  String id;
  String Url;

  static final DepartmentSingleton _singleton = DepartmentSingleton._internal();

  factory DepartmentSingleton() {
    return _singleton;
  }

  DepartmentSingleton._internal();
}