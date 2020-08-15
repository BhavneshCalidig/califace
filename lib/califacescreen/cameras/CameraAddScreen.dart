import 'package:califace/custom_widgets/CustomButtonRc.dart';
import 'package:califace/custom_widgets/CustomDropDownButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class CameraAddScreen extends StatefulWidget {
  @override
  _CameraAddScreenState createState() => _CameraAddScreenState();
}

class _CameraAddScreenState extends State<CameraAddScreen> {
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
                labelText: "Camera IP",
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
                labelText: "Protocol",
                onChanged: (Value) {
                  // value=Value.toString();
                  print(Value.toString());
                },
                validate: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(labelText: "Port",onChanged: (Value) {
                // value=Value.toString();
                print(Value.toString());
              },validate: true,),


              SizedBox(
                height: 10,
              ),
              CustomTextField(labelText: "Status",onChanged: (Value) {
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
