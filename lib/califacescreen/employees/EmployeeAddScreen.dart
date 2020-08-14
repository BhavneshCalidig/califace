import 'package:califace/custom_widgets/CustomButtonRc.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class EmployeeAddScreen extends StatefulWidget {
  @override
  _EmployeeAddScreenState createState() => _EmployeeAddScreenState();
}

class _EmployeeAddScreenState extends State<EmployeeAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 20,left: 10,right: 10),
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

                 CustomTextField(
                  labelText: "Enter Name",

                  onChanged: (Value) {
                    // value=Value.toString();
                    print(Value.toString());
                  },
                  validate: true,
                ),

              SizedBox(height: 10,),
              CustomTextField(
                labelText: "Enter Name",
                onChanged: (Value) {
                  // value=Value.toString();
                  print(Value.toString());
                },
                validate: true,
              ),
              SizedBox(height: 10,),
              CustomButtonRc(text: "Submitt",onpressed: (){

              },),


            ],
          ),
        ),
      ),
    );
  }
}
