class LoginSingleton {

  String accesToke;
  String tokenType;


  static final LoginSingleton _singleton = LoginSingleton._internal();

  factory LoginSingleton() {
    return _singleton;
  }

  LoginSingleton._internal();
}