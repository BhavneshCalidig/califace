import 'package:califace/califacescreen/Login/Model/LoginModel.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _login();
  }

}
class _login extends State<login>{
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
      backgroundColor: Colors.white,

       body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0,vertical: 25),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255,245,245,245),
                  borderRadius:  BorderRadius.all(Radius.circular(40.0))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(child: Text("Login",style: TextStyle(fontSize: 30),)),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      Username=value;
                    },
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: 'Username',
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color.fromARGB(255,102,117,223), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color.fromARGB(255,102,117,223), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      password=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password.',
                      hintStyle: TextStyle(color: Colors.black),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color.fromARGB(255,102,117,223), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color.fromARGB(255,102,117,223), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Color.fromARGB(255,102,117,223),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          // LoginSingleton l=LoginSingleton();

                          // LoginDataModel ldm= await
                          LoginData(Username, password);
//                 AccesToken=ldm.accessToken;
//
//                 return AccesToken!=null?HomeScreen():Text("error");

                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Log In',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}