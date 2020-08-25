import 'file:///E:/projects/califace/lib/califacescreen/employees/Models/employeDataModel.dart';
import 'package:califace/califacescreen/employees/Models/EmployeeStoreDataModel.dart';
import 'package:califace/califacescreen/employees/Models/EmployeeUpdateDataModel.dart';
import 'package:califace/califacescreen/employees/Models/EmployeeUpdateModel.dart';
import 'package:califace/califacescreen/employees/Models/employeDataModel.dart';
import 'package:califace/custom_widgets/CustomButtonRc.dart';
import 'package:califace/custom_widgets/CustomDropDownButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/custom_widgets/Custom_DropDownForm.dart';
import 'package:califace/custom_widgets/Custom_Submit_Button.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/MyColor.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class EmployeeAddScreen extends StatefulWidget {
  EmployeeAddScreen({this.Id,this.Url});
  final String Id;
  final String Url;
  @override
  _EmployeeAddScreenState createState() => _EmployeeAddScreenState();
}

class _EmployeeAddScreenState extends State<EmployeeAddScreen> {
  String Gender ="Male";
  String Designation='Select';
  String Department='Select';
  String department;
  String designation;
  String gender;
  String Firstname;
  String lastname;
  String email;
  String contact;
  String employId;
 var Updatelist;
 Future<EmployeeUpdateDataModel> _eudm;

  Future<EmployeeStoreDataModel>StoreEmployee ( String department, String designation, String gender, String Firstname, String lastname, String email, String contact, String employId,)async{
    Map<String,dynamic > databody={
      "first_name":Firstname,
      "last_name":lastname,
      "email":email,
      "gender":gender,
      "department_id":department,
      "designation_id":designation,
      "contact_no":contact,
      "employee_id":employId,
    };

    var Respose=await NetworkServices().postApi(context, empCreateUrl, databody);
    return EmployeeStoreDataModel.fromJson(Respose);
  }
  Future<EmployeeUpdateModel>UpdateEmployee ( String Id,String department, String designation, String gender, String Firstname, String lastname, String email, String contact, String employId,)async{
    Map<String,dynamic > databody={
      "first_name":Firstname,
      "last_name":lastname,
      "id":Id,
      "email":email,
      "gender":gender,
      "department_id":department,
      "designation_id":designation,
      "contact_no":contact,
      "employee_id":employId,
    };

    var Respose=await NetworkServices().postApi(context, empUpdateUrl, databody);
    return EmployeeUpdateModel.fromJson(Respose);
  }
  Future<EmployeeUpdateDataModel> getData()async{
    var response= await NetworkServices().getApi(context, widget.Url);
    Updatelist =EmployeeUpdateDataModel.fromJson(response);
    return Updatelist;
  }
  @override
  void initState() {
    _eudm=getData();
    // TODO: implement initState
    super.initState();
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

                labelText: "First Name",
                onChanged: (Value) {
            setState(() {
              Firstname=Value;
            });
                  // value=Value.toString();
                  print(Value.toString());
                },
                validate: true,
              ),

              CustomTextField(
                labelText: "Last Name",
                onChanged: (Value) {
               setState(() {
                 lastname=Value;
               });
                  // value=Value.toString();
                  print(Value.toString());
                },
                validate: true,
              ),

              CustomTextField(labelText: "Email",onChanged: (Value) {
                setState(() {
                  email=Value;
                });
                // value=Value.toString();
                print(Value.toString());
              },validate: true,),


//
////              Row(
////                children: <Widget>[
////                  Padding(
////                      padding: EdgeInsets.only( left: 10, right: 10),
////                      child: Text(
////                        "Gender",
////                        style: TextStyle(fontSize: 18),
////                      )),
////                  Padding(
////                    padding: EdgeInsets.only( left: 10, right: 10),
////                    child: CustomDropDownButton(
////                      items: ['Select', 'Male', 'Female'],
////                      value:Gender,
////                      onChanged: (val) {
////                       if(val=='Male'){
////                         setState(() {
////
////                           Gender = val;
////                           gender='m';
////                           print(gender);
////                         });
////                       }
////                       else if(val=='Female'){
////                         setState(() {
////
////                           Gender = val;
////                          gender ='f';
////                          print(gender);
////                         });
////                       }
////                      },
////                    ),
////                  )
////                ],
////              ),
//
//
              CustomTextField(labelText: "Contact",onChanged: (Value) {
                // value=Value.toString();
                setState(() {
                  contact=Value;
                });
                print(Value.toString());
              },validate: true,),

              CustomTextField(labelText: "Employee ID:",onChanged: (Value) {
                // value=Value.toString();
                setState(() {
                  employId=Value;
                });
                print(Value.toString());
              },validate: true,),
//              SizedBox(
//                height: 5,
//              ),
////              Row(
////                children: <Widget>[
////                  Padding(
////                      padding: EdgeInsets.only( left: 10, right: 10),
////                      child: Text(
////                        "Designation",
////                        style: TextStyle(fontSize: 18),
////                      )),
////                  Padding(
////                    padding: EdgeInsets.only( left: 10, right: 10),
////                    child: CustomDropDownButton(
////                      items: ['Select', 'Php Developer', 'Flutter Developer','HR Executive','Manger','Assistant','Executive'],
////                      value:Designation,
////                      onChanged: (val) {
////                       if(val=='Php Developer'){
////                         setState(() {
////
////                           Designation = val;
////                           designation='1';
////                          print(designation);
////                         });
////                       }
////                       else if(val=='Flutter Developer'){
////                         setState(() {
////                           Designation = val;
////                           designation='2';
////                           print(designation);
////                         });
////                       }
////                       else if(val=='HR Executive'){
////                         setState(() {
////                           Designation = val;
////                           designation='3';
////                           print(designation);
////                         });
////                       }
////                       else if(val=='Manger'){
////                         setState(() {
////                           Designation = val;
////                           designation='4';
////                           print(designation);
////                         });
////                       }
////                       else if(val=='Assistant'){
////                         setState(() {
////                           Designation = val;
////                           designation='5';
////                           print(designation);
////                         });
////                       }
////                       else if(val=='Executive'){
////                         setState(() {
////                           Designation = val;
////                           designation='6';
////                           print(designation);
////                         });
////                       }
////                      },
////
////                    ),
////                  )
////                ],
////              ),
////              SizedBox(
////                height: 5,
////              ),
////              Row(
////                children: <Widget>[
////                  Padding(
////                      padding: EdgeInsets.only( left: 10, right: 10),
////                      child: Text(
////                        "Department",
////                        style: TextStyle(fontSize: 18),
////                      )),
////                  Padding(
////                    padding: EdgeInsets.only( left: 10, right: 10),
////                    child: CustomDropDownButton(
////                      items: ['Select', 'Php ', 'Android','HR ','Manger','Accounts','IT'],
////                      value:Department,
////                      onChanged: (val) {
////                       if(val=='Php'){
////                         setState(() {
////
////                           Department = val;
////                           department='1';
////                           print(department);
////                         });
////                       }
////                       else if(val=='Android'){
////                         setState(() {
////                           Department = val;
////                           department='2';
////                           print(department);
////                         });
////                       }
////                       else if(val=='HR'){
////                         setState(() {
////                           Department = val;
////                           department='3';
////                           print(department);
////                         });
////                       }
////                       else if(val=='Manager'){
////                         setState(() {
////                           Department = val;
////                           department='4';
////                           print(department);
////                         });
////                       }
////                       else if(val=='Accounts'){
////                         setState(() {
////                           Department = val;
////                           department='5';
////                           print(department);
////                         });
////                       }
////                       else if(val=='IT'){
////                         setState(() {
////                           Department = val;
////                           department='6';
////                           print(department);
////                         });
////                       }
////                      },
////                    ),
////                  )
////                ],
////              ),
//              SizedBox(
//                height: 25,
//              ),
//              Custom_DropDownForm(text: "Please Select Gender",value: Gender,items:["Male","Female"],onChanged: (val){
//                setState(() {
//                  Gender=val;
//                });
//              },),
//              SizedBox(
//                height: 15,
//              ),
//              Custom_DropDownForm(text: "please Select Designation",items:  [ 'Php Developer', 'Flutter Developer','HR Executive','Manger','Assistant','Executive'],onChanged: (val){
//                if(val=='Php Developer'){
//                  setState(() {
//
//                    Designation = val;
//                    designation='1';
//                    print(designation);
//                  });
//                }
//                else if(val=='Flutter Developer'){
//                  setState(() {
//                    Designation = val;
//                    designation='2';
//                    print(designation);
//                  });
//                }
//                else if(val=='HR Executive'){
//                  setState(() {
//                    Designation = val;
//                    designation='3';
//                    print(designation);
//                  });
//                }
//                else if(val=='Manger'){
//                  setState(() {
//                    Designation = val;
//                    designation='4';
//                    print(designation);
//                  });
//                }
//                else if(val=='Assistant'){
//                  setState(() {
//                    Designation = val;
//                    designation='5';
//                    print(designation);
//                  });
//                }
//                else if(val=='Executive'){
//                  setState(() {
//                    Designation = val;
//                    designation='6';
//                    print(designation);
//                  });
//
//                }}),
//              SizedBox(
//                height: 25,
//              ),
//              Custom_DropDownForm(items:[ 'Php ', 'Android','HR ','Manger','Accounts','IT'],text: "Please Select Department",onChanged: (val){
//
//                if(val=='Php'){
//                  setState(() {
//
//                    Department = val;
//                    department='1';
//                    print(department);
//                  });
//                }
//                else if(val=='Android'){
//                  setState(() {
//                    Department = val;
//                    department='2';
//                    print(department);
//                  });
//                }
//                else if(val=='HR'){
//                  setState(() {
//                    Department = val;
//                    department='3';
//                    print(department);
//                  });
//                }
//                else if(val=='Manager'){
//                  setState(() {
//                    Department = val;
//                    department='4';
//                    print(department);
//                  });
//                }
//                else if(val=='Accounts'){
//                  setState(() {
//                    Department = val;
//                    department='5';
//                    print(department);
//                  });
//                }
//                else if(val=='IT'){
//                  setState(() {
//                    Department = val;
//                    department='6';
//                    print(department);
//                  });
//                }
//              },)
//              ,SizedBox(
//                height: 25,
//              ),

            CustomDropDownButton(items: ['Male', 'Female'],hintText: "Select Gender",),

            CustomDropDownButton(items:[ 'Php ', 'Android','HR ','Manger','Accounts','IT'],onChanged: (val){},hintText: "Enter Department",),

               CustomDropDownButton( items: [ 'Php Developer', 'Flutter Developer','HR Executive','Manger','Assistant','Executive'],hintText: "Enter Designation",onChanged: (val){},),

               Custom_Submit_Button(
                text: "Submit",
                color: darkgrey,

                onPressed: ()async {

//                  final StoreEmployeData stemp=await createEmploye(firtsname, Lastname, Email, gender, Contact, designation, department, Employid);
//print(stemp);

                  Map<String,dynamic > databody={
                    "first_name":Firstname,
                    "last_name":lastname,
                    "email":email,
                    "gender":gender,
                    "department_id":department,
                    "designation_id":designation,
                    "contact_no":contact,
                    "employee_id":employId,


                  };
await NetworkServices().postApi(context, empCreateUrl, databody);
print(databody);

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
