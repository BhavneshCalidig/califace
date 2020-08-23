import 'package:califace/califacescreen/designations/Models/DesignationStoreModel.dart';
import 'package:califace/custom_widgets/CustomButtonRc.dart';

import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/custom_widgets/Custom_Submit_Button.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

class DesignationAddScreen extends StatefulWidget {
  @override
  _DesignationAddScreenState createState() => _DesignationAddScreenState();
}

class _DesignationAddScreenState extends State<DesignationAddScreen> {
String Title;
String Description;
Future<DesignationStoretModel> createUser(String Title,String Description) async{
  Map<String,dynamic > databody={
    "title": Title,
    "description": Description

  };
  var Respose= await NetworkServices().postApi(context, designationStoreUrl, databody);
  return DesignationStoretModel.fromJson(Respose);

}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomTextField(
                labelText: "Title",
                onChanged: (Value) {
                  setState(() {
                    Title=Value.toString();
                  });
                  // value=Value.toString();
                  print(Value.toString());
                },
                validate: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                labelText: "Role and Responsibilities",
                onChanged: (Value) {
                  setState(() {
                    Description=Value.toString();
                  });
                  // value=Value.toString();
                  print(Value.toString());
                },
                validate: true,
              ),

              Custom_Submit_Button(
                text: "Submit",
                onPressed: () async{
                 final DesignationStoretModel model= await createUser(Title, Description);


                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
