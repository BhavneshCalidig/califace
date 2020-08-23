import 'package:califace/califacescreen/departments/Model/DepartmentStoreData_Model.dart';
import 'package:califace/custom_widgets/CustomButtonRc.dart';
import 'package:califace/custom_widgets/CustomDropDownButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/custom_widgets/Custom_Submit_Button.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

class DepartmentAddScreen extends StatefulWidget {
  @override
  _DepartmentAddScreenState createState() => _DepartmentAddScreenState();
}

class _DepartmentAddScreenState extends State<DepartmentAddScreen> {
String Deaprtment;
String Hod;
String Email;
String Contact;
String Date;
String TotalEmploye;
String About;

Future<DepartmentStoreDataModel>StoreDepartment (String About,String Email,String Hod,String Contact,String Date,String Deaprtment,String TotalEmploye)async{
  Map<String,dynamic > databody={
    "description": About,
    "email": Email,
    "hod": Hod,
    "phone": Contact,
    "starting_date": Date,
    "title": Deaprtment,
    "total_employee": TotalEmploye,
  };

  var Respose=await NetworkServices().postApi(context, departmentStoreUrl, databody);
  return DepartmentStoreDataModel.fromJson(Respose);
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
                labelText: "Department Name",
                onChanged: (Value) {
                  setState(() {
                    Deaprtment=Value.toString();
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
                labelText: "Head of Department",
                onChanged: (Value) {
                  setState(() {
                    Hod=Value.toString();
                  });
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
                setState(() {
                  Email=Value.toString();
                });
                print(Value.toString());
              },validate: true,),


              SizedBox(
                height: 10,
              ),
              CustomTextField(labelText: "Contact",hintText: "Contact No:",onChanged: (Value) {
                setState(() {
                  Contact=Value.toString();
                });
                // value=Value.toString();
                print(Value.toString());
              },validate: true,),
              SizedBox(
                height: 10,
              ),
              CustomTextField(labelText: "Starting Date:",hintText: "Starting Date",onChanged: (Value) {
                // value=Value.toString();
                setState(() {
                  Date=Value.toString();
                });
                print(Value.toString());
              },validate: true,),

              SizedBox(
                height: 10,
              ),
              CustomTextField(labelText: "Total Employee",hintText: "Total Employee",onChanged: (Value) {
                setState(() {
                  TotalEmploye=Value.toString();
                });
                // value=Value.toString();
                print(Value.toString());
              },validate: true,),
              CustomTextField(labelText: "About",hintText: "More About Department",onChanged: (Value) {
                // value=Value.toString();
                setState(() {
                  About=Value.toString();
                });
                print(Value.toString());
              },validate: true,),



              Custom_Submit_Button(
                text: "Submit",
                onPressed: () async{
                  final DepartmentStoreDataModel model= await StoreDepartment(About, Email, Hod, Contact, Date, Deaprtment, TotalEmploye);
print(model);

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
