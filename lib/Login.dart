import 'package:califace/califacescreen/HomeScreen.dart';
import 'package:califace/califacescreen/Login/Model/LoginModel.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:califace/utill/myfunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



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
  SharedPreferences prefs ;
  bool newUSer;





  Future<LoginDataModel> LoginData(String Username,String password ) async  {
    Map<String ,dynamic>dataBody={

      "client_id": "4",
      "client_secret": "j7Gn5jg3Xmiwshb8NJ2hhftfiq03AtBpz5QnYCQu",
      "grant_type": "password",
      "password": password,
      "scope": "",
      "username": Username

    };

    Map<String, dynamic> map  = await NetworkServices().postLoginApi(context, loginUrl, dataBody);
    return userDataLoginModel=LoginDataModel.fromJson(map);



  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserLoggedin();
  }
  void UserLoggedin() async {
    prefs= await SharedPreferences.getInstance();
    newUSer=prefs.getBool("login") ?? true;
    print(newUSer);
    if(newUSer==false){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      },));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
      backgroundColor: Colors.white,

       body: Stack(

         children: <Widget>[

           Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0,vertical: 25),
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 460,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255,245,245,245),
                      borderRadius:  BorderRadius.all(Radius.circular(40.0))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(child: Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                      SizedBox(
                        height: 78.0,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                         setState(() {
                           Username=value;
                         });
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
                          setState(() {
                            password=value;
                          });

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
                              print(Username);
                              print(password);
                              if(Username==null||Username==""||password==null||password==""){
                                showToast(context, "Field cannot be Empty");
                              }
                              else{
                                LoginDataModel ldm= await LoginData(Username, password);

                                if(ldm.accessToken !=null){
                                  prefs.setBool("login", false);
                                  AccesToken=ldm.tokenType+" "+ldm.accessToken;
                                  print(AccesToken);
                                  prefs.setString("accesToken", AccesToken);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return HomeScreen();
                                  },));
                                }
                                else{
                                  showToast(context, "Invalid Credentials");
                                }
                              }






                            },
                            minWidth: 250.0,
                            height: 42.0,
                            child: Text(
                              'Log In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ), Positioned(left: 20,top: 45,child: Image(image: AssetImage("assets/images/calidigLogo.png"),height: 200,width: 350,)),
         ],
       ),

    );
  }


}