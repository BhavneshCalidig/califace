import 'package:califace/califacescreen/Login/Model/LoginModel.dart';

import 'package:califace/custom_widgets/CustomHomeButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/custom_widgets/Custom_Submit_Button.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/MyColor.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }
}
class _LoginScreen extends State<LoginScreen>{


  String Username;
  String AccesToken;
  String TokenType;
  String password;

 LoginDataModel userDataLoginModel;
  var NetworkHelper;
  Future<LoginDataModel> _ldm;

  LoginData(String Username,String password ) async  {
    Map<String ,dynamic>dataBody={

      "client_id": "2",
      "client_secret": "PZMbAud03HubaX8NIZN8vW0U7WZUYWq7SjKHSI5n",
      "grant_type": "password",
      "password": password,
      "scope": "",
      "username": Username

    };

    Map<String, dynamic> map  =await NetworkServices().postLoginApi(context, loginUrl, dataBody);
    userDataLoginModel=LoginDataModel.fromJson(map);

    try{
      String token=userDataLoginModel.accessToken;


      print("<<"+token);
    }catch(e)
    {

    }

  }
//  getUserDetail() async{
//    var Response = await NetworkServices().getApi(context, userUrl);
//  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
         Divider(
           height: 150,
         ),
         Container(
           decoration: BoxDecoration(
               color: Colors.grey,
               borderRadius:  BorderRadius.all(Radius.circular(40.0))
           ),
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
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
                Custom_Submit_Button(color: darkgrey,text: "Login",onPressed: () async {
                 // LoginSingleton l=LoginSingleton();

                // LoginDataModel ldm= await
                 LoginData(Username, password);
//                 AccesToken=ldm.accessToken;
//
//                 return AccesToken!=null?HomeScreen():Text("error");


                },),


              ],
            ),
          ),
        ),
      ]),
    );
  }
}