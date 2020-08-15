import 'package:califace/custom_widgets/CustomButtonRc.dart';
import 'package:califace/custom_widgets/CustomDropDownButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class EmployeeAddScreen extends StatefulWidget {
  @override
  _EmployeeAddScreenState createState() => _EmployeeAddScreenState();
}

class _EmployeeAddScreenState extends State<EmployeeAddScreen> {
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
                labelText: "First Name",
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
                labelText: "Last Name",
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
                height: 5,
              ),

              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only( left: 10, right: 10),
                      child: Text(
                        "Gender",
                        style: TextStyle(fontSize: 18),
                      )),
                  Padding(
                    padding: EdgeInsets.only( left: 10, right: 10),
                    child: CustomDropDownButton(
                      items: ['Select', 'Male', 'Female'],
                      value:Gender,
                      onChanged: (val) {
                        setState(() {
                         Gender = val;
                        });
                      },
                    ),
                  )
                ],
              ),

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
              CustomTextField(labelText: "Employee ID:",hintText: "Employee ID",onChanged: (Value) {
                // value=Value.toString();
                print(Value.toString());
              },validate: true,),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only( left: 10, right: 10),
                      child: Text(
                        "Designation",
                        style: TextStyle(fontSize: 18),
                      )),
                  Padding(
                    padding: EdgeInsets.only( left: 10, right: 10),
                    child: CustomDropDownButton(
                      items: ['Select', 'Php Developer', 'Flutter Developer','HR Executive','Manger','Assistant','Executive'],
                      value:Designation,
                      onChanged: (val) {
                        setState(() {
                         Designation = val;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only( left: 10, right: 10),
                      child: Text(
                        "Department",
                        style: TextStyle(fontSize: 18),
                      )),
                  Padding(
                    padding: EdgeInsets.only( left: 10, right: 10),
                    child: CustomDropDownButton(
                      items: ['Select', 'Php ', 'Android','HR ','Manger','Accounts','IT'],
                      value:Department,
                      onChanged: (val) {
                        setState(() {
                          Department = val;
                        });
                      },
                    ),
                  )
                ],
              ),


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
