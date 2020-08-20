
import 'package:califace/custom_widgets/CustomHomeButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }
}
class _LoginScreen extends State<SignUp_Screen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Center(
                child: CustomTextField(hintText: "Username",validate: true,),
              ),
              Center(
                child: CustomTextField(hintText: "Password",isPassword: true,validate: true,),
              ),
              CustomHomeButton(text: "Login",onpressed: (){},),
              InkWell(child: Text("New User"),)

            ],
          ),
        ),
      ),
    );
  }
}