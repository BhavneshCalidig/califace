class EmployeeSingleton {

  String id;


  static final EmployeeSingleton _singleton = EmployeeSingleton._internal();

  factory EmployeeSingleton() {
    return _singleton;
  }

  EmployeeSingleton._internal();
}