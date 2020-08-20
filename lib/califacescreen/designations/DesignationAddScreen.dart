import 'package:califace/custom_widgets/CustomButtonRc.dart';

import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/custom_widgets/Custom_Submit_Button.dart';
import 'package:flutter/material.dart';

class DesignationAddScreen extends StatefulWidget {
  @override
  _DesignationAddScreenState createState() => _DesignationAddScreenState();
}

class _DesignationAddScreenState extends State<DesignationAddScreen> {
  String Gender = 'Select';
  String Designation='Select';
  String Department='Select';

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
                  // value=Value.toString();
                  print(Value.toString());
                },
                validate: true,
              ),

              Custom_Submit_Button(
                text: "Submit",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
