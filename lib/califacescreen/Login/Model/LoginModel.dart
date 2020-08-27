import 'dart:convert';

LoginDataModel loginDataModelFromJson(String str) => LoginDataModel.fromJson(json.decode(str));

String loginDataModelToJson(LoginDataModel data) => json.encode(data.toJson());

class LoginDataModel {
  LoginDataModel({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  });

  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
  );

  Map<String, dynamic> toJson() => {
    "token_type": tokenType,
    "expires_in": expiresIn,
    "access_token": accessToken,
    "refresh_token": refreshToken,
  };
}
