import 'package:califace/custom_widgets/CustomHomeButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart'as oauth2;

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }
}
class _LoginScreen extends State<LoginScreen>{


  String Username;
  String password;
  final tokenEndpoint =Uri.parse("https://virola-laravel.calidig.com/oauth/token");
  final authorizationEndpoint=Uri.parse('https://virola-laravel.calidig.com/api/v1/user');

  final identifier = "my client identifier";
  final secret = "my client secret";
  Future<oauth2.Client> getClient() async {
    var grant = new oauth2.AuthorizationCodeGrant(
        identifier, authorizationEndpoint, tokenEndpoint,
        secret: secret);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Center(
                child: CustomTextField(hintText: "Username",validate: true,onChanged:(val) {
                  setState(() {
                    Username=val;
                  });

                },),
              ),
              Center(
                child: CustomTextField(hintText: "Password",isPassword: true,validate: true,onChanged: (val){
                  setState(() {
                    password=val;
                  });
                },),
              ),
              CustomHomeButton(text: "Login",onpressed: (){
                Map<String ,dynamic>dataBody={

                  	"password": password,
                  	"username": Username,
                  	"grant_type": password

                };
                NetworkServices().postApi(context, loginUrl, dataBody);
                print(dataBody);
              },),
              InkWell(child: Text("New User"),)

            ],
          ),
        ),
      ),
    );
  }
}