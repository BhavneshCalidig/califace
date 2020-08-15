import 'package:califace/custom_widgets/CustomButtonRc.dart';
import 'package:califace/custom_widgets/CustomDropDownButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class DepartmentAddScreen extends StatefulWidget {
  @override
  _DepartmentAddScreenState createState() => _DepartmentAddScreenState();
}

class _DepartmentAddScreenState extends State<DepartmentAddScreen> {
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
                labelText: "Department Name",
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
                labelText: "Head of Department",
                onChanged: (Value) {
                  // value=Value.toString();
                  print(Value.toString());
                },
                validate: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(labelText: "Email",hintText: "Email",onChanged: (Value) {
                // value=Value.toString();
                print(Value.toString());
              },validate: true,),


              SizedBox(
                height: 10,
              ),
              CustomTextField(labelText: "Contact",hintText: "Contact No:",onChanged: (Value) {
                // value=Value.toString();
                print(Value.toString());
              },validate: true,),
              SizedBox(
                height: 10,
              ),
              CustomTextField(labelText: "Starting Date:",hintText: "Starting Date",onChanged: (Value) {
                // value=Value.toString();
                print(Value.toString());
              },validate: true,),

              SizedBox(
                height: 10,
              ),
              CustomTextField(labelText: "Total Employee",hintText: "Total Employee",onChanged: (Value) {
                // value=Value.toString();
                print(Value.toString());
              },validate: true,),
              CustomTextField(labelText: "About",hintText: "More About Department",onChanged: (Value) {
                // value=Value.toString();
                print(Value.toString());
              },validate: true,),



              CustomButtonRc(
                text: "Submitt",
                onpressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
