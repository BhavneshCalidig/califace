import 'dart:io';

import 'package:califace/califacescreen/departments/Model/DepartmentListData_Model.dart';
import 'package:califace/califacescreen/designations/Models/DesignationListModel.dart';
import 'package:califace/califacescreen/employees/Models/EmployeeStoreDataModel.dart';
import 'package:califace/califacescreen/employees/Models/EmployeeUpdateDataModel.dart';
import 'package:califace/califacescreen/employees/Models/EmployeeUpdateModel.dart';
import 'package:califace/califacescreen/employees/mywidgets/EmployeSingleton.dart';
import 'package:califace/custom_widgets/CustomDropDownButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/custom_widgets/Custom_Submit_Button.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/MyColor.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class EmployeeAddScreen extends StatefulWidget {

  @override
  _EmployeeAddScreenState createState() => _EmployeeAddScreenState();
}

class _EmployeeAddScreenState extends State<EmployeeAddScreen> {
  var Gender ;
  String Male="Male";
  String female="Female";
  String ge;
  String department;
  String designation;
  String gender;
  String Firstname;
  String lastname;
  String email;
  String contact;
  String employId;
  var Department=TextEditingController();
  var Designation=TextEditingController();
  var geender=TextEditingController();
  var firstname=TextEditingController();
  var Lastname=TextEditingController();
  var Email=TextEditingController();
  var Contact=TextEditingController();
  var EmployId=TextEditingController();
  String Id;
  int DesID;
  int DepID;
  EmployeeUpdateDataModel Updatelist;
  File _image;
  List<DesignationList> designationlist;
  List<DepartmentListData> departmentlist;
  DepartmentListData dep;
  DesignationList des;
  Future<EmployeeUpdateDataModel> _employeeupdateDataModel;
  Future<DesignationlistModel> _dlm;
  getImage() async {
// ignore: deprecated_member_use
    var pic = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
    this.setState(() {
      _image = pic;
    });
  }

  Future<EmployeeStoreDataModel>StoreEmployee ( int DepID, int DesID, String ge, String Firstname, String lastname, String email, String contact, String employId,)async{
    Map<String,dynamic > databody={
      "first_name":Firstname,
      "last_name":lastname,
      "email":email,
      "gender":ge,
      "department_id":DepID,
      "designation_id":DepID,
      "contact_no":contact,
      "employee_id":employId,
    };

   Map<String,dynamic> Respose=await NetworkServices().postApi(context, empStoreUrl, databody);
    return EmployeeStoreDataModel.fromJson(Respose);
  }
 UpdateEmployee ( String Id,String department, String designation, String gender, String Firstname, String lastname, String email, String contact, String employId,)  async {
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

    Map<String,dynamic>Respose=await NetworkServices().postApi(context, empUpdateUrl, databody);
    return EmployeeUpdateModel.fromJson(Respose);
  }
  Future<EmployeeUpdateDataModel> getData() async {
    Map<String,dynamic> response= await NetworkServices().getApi(context, empUpdateDataUrl+Id);
    Updatelist =EmployeeUpdateDataModel.fromJson(response);
    return Updatelist;
  }
  Future<DepartmentListDataModel> getDepartmentData() async {
    Map<String,dynamic> response = await NetworkServices().getApi(context, departmentListUrl);

    setState(() {
      departmentlist = DepartmentListDataModel.fromJson(response).departmentListData;
    });
  }
  Future<DesignationlistModel> geData()async{
    Map<String,dynamic> response= await NetworkServices().getApi(context, designationListUrl);
    // print("DesignatioN lISt>>> "+response);
    setState(() {
      designationlist =DesignationlistModel.fromJson(response).designationList;
    });

    // return designationlist;
  }
  getID(){
    EmployeeSingleton employeeSingleton=EmployeeSingleton();
    return Id= employeeSingleton.id;
  }
  @override
  void initState() {
    getID();
    print(Id);
    _employeeupdateDataModel=getData();
    geData();
    getDepartmentData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          margin: EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
              child: FutureBuilder<EmployeeUpdateDataModel>(future:_employeeupdateDataModel ,builder:(context ,snapshots){
                if(snapshots.hasData){
                  var Item=snapshots.data.employeupdateData;
                  firstname.text=Item.firstName;
                  Lastname.text=Item.lastName;
                  Email.text=Item.email;
                  EmployId.text=Item.employeeId;
                  Contact.text=Item.contactNo;
                  return Column(
                    children: <Widget>[
                      CustomTextField(controller: firstname,

                        labelText: "First Name",
                        onChanged: (Value) {
                          setState(() {
                            firstname=Value;

                          });
                          // value=Value.toString();
                          print(Value.toString());
                        },
                        validate: true,
                      ),

                      CustomTextField(controller: Lastname,
                        labelText: "Last Name",
                        onChanged: (Value) {
                          setState(() {
                            Lastname=Value;

                          });
                          // value=Value.toString();
                          print(Value.toString());
                        },
                        validate: true,
                      ),

                      CustomTextField(controller: Email,labelText: "Email",onChanged: (Value) {
                        setState(() {
                          email=Value;

                        });
                        // value=Value.toString();
                        print(Value.toString());
                      },validate: false,),


                      CustomTextField(controller: Contact,labelText: "Contact",onChanged: (Value) {
                        // value=Value.toString();
                        setState(() {
                          Contact=Value;
                        });
                        print(Value.toString());
                      },validate: true,),

                      CustomTextField(controller: EmployId,labelText: "Employee ID:",onChanged: (Value) {
                        // value=Value.toString();
                        setState(() {
                          EmployId=Value;
                        });
                        print(Value.toString());
                      },validate: true,),

                      Row(
                        children: <Widget>[
                          designationlist!=null? Expanded(

                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 3,
                                )),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<DesignationList>(
                                  isExpanded: true,
                                  hint: Text("Select Designation",style: TextStyle(
                                      color: Theme.of(context).indicatorColor,
                                      fontSize: 18
                                  ),),
                                  value: des,
//                            validator: (arg) {
//                              if (arg==null)
//                                return 'Please select Address type';
//                              else
//                                return null;
//                            },
                                  onChanged: (DesignationList Value) {
//
                                    setState(() {
                                      des = Value;
                                      DesID=des.id;
                                    });
                                    print(DesID);
                                  },
                                  items: designationlist
                                      .map((DesignationList user) {
                                    return DropdownMenuItem<DesignationList>(
                                      value: user,
                                      child: Row(
                                        children: <Widget>[
                                          //user.icon,
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              user.title,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          )],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ):Text("Loading Designation",style: TextStyle(
                              color: Theme.of(context).indicatorColor,
                              fontSize: 18
                          ),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          departmentlist!=null? Expanded(

                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 3,
                                )),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<DepartmentListData>(
                                  isExpanded: true,
                                  hint: Text("Select Department",style: TextStyle(
                                      color: Theme.of(context).indicatorColor,
                                      fontSize: 18
                                  ),),
                                  value: dep,
//                            validator: (arg) {
//                              if (arg==null)
//                                return 'Please select Address type';
//                              else
//                                return null;
//                            },
                                  onChanged: (DepartmentListData Value) {
//
                                    setState(() {
                                      dep = Value ;
                                      DepID=dep.id;
                                    });
                                    print(DepID);
                                  },
                                  items: departmentlist
                                      .map((DepartmentListData user) {
                                    return DropdownMenuItem<DepartmentListData>(
                                      value: user,
                                      child: Row(
                                        children: <Widget>[
                                          //user.icon,
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              user.title,
                                              style: TextStyle(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          )],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ):Text("Loading Department",style: TextStyle(
                              color: Theme.of(context).indicatorColor,
                              fontSize: 18
                          ),
                          ),
                        ],
                      ),

                      CustomDropDownButton(value: Gender,items: [Male, female],hintText: "Select Gender",onChanged: (val){
                        if(val==Male){
                          Gender=val;
                          setState(() {
                            ge="m";
                          });
                          print(ge);
                        }
                        else{
                          setState(() {
                            ge="f";
                          });
                          print(ge);
                        }

                      },),
                      Container(
                        color: Colors.white,
                        width: 150,
                        height: 50
                        ,
child: Center(
  child: IconButton(icon: Icon(Icons.add_a_photo),onPressed: (){
    return getImage();
  },),
),
                      ),

                      Custom_Submit_Button(
                        text: "Submit",
                        color: darkgrey,

                        onPressed: ()async {
                          Firstname=firstname.toString();
                          lastname=Lastname.toString();
//                        email=Email.toString();
                          contact=Contact.toString();
                          employId=EmployId.toString();
//
//                        final EmployeeStoreDataModel stemp=await StoreEmployee(DepID, DesID, ge, Firstname, lastname, email, contact, employId);
//                        print(stemp);
                          final EmployeeUpdateModel eum = await UpdateEmployee(Id, department, designation, gender, Firstname, lastname, email, contact, employId);

                          print(eum);
//                    Map<String,dynamic > databody={
//                      "first_name":Firstname,
//                      "last_name":lastname,
//                      "email":email,
//                      "gender":gender,
//                      "department_id":department,
//                      "designation_id":designation,
//                      "contact_no":contact,
//                      "employee_id":employId,
//
//
//                    };
//await NetworkServices().postApi(context, empCreateUrl, databody);
//print(databody);

                        },
                      ),
                    ],
                  );
                }
                else{
                  return Column(
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

                      Row(
                        children: <Widget>[
                          designationlist!=null? Expanded(

                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 3,
                                )),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<DesignationList>(
                                  isExpanded: true,
                                  hint: Text("Select Designation",style: TextStyle(
                                      color: Theme.of(context).indicatorColor,
                                      fontSize: 18
                                  ),),
                                  value: des,
//                            validator: (arg) {
//                              if (arg==null)
//                                return 'Please select Address type';
//                              else
//                                return null;
//                            },
                                  onChanged: (DesignationList Value) {
//
                                    setState(() {
                                      des = Value;
                                      DesID=des.id;
                                    });
                                    print(DesID);
                                  },
                                  items: designationlist
                                      .map((DesignationList user) {
                                    return DropdownMenuItem<DesignationList>(
                                      value: user,
                                      child: Row(
                                        children: <Widget>[
                                          //user.icon,
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              user.title,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          )],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ):Text("Loading Designation ",style: TextStyle(
                              color: Theme.of(context).indicatorColor,
                              fontSize: 18
                          ),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          departmentlist!=null? Expanded(

                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 3,
                                )),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<DepartmentListData>(
                                  isExpanded: true,
                                  hint: Text("Select Department",style: TextStyle(
                                      color: Theme.of(context).indicatorColor,
                                      fontSize: 18
                                  ),),
                                  value: dep,
//                            validator: (arg) {
//                              if (arg==null)
//                                return 'Please select Address type';
//                              else
//                                return null;
//                            },
                                  onChanged: (DepartmentListData Value) {
//
                                    setState(() {
                                      dep = Value ;
                                      DepID=dep.id;
                                    });
                                    print(DepID);
                                  },
                                  items: departmentlist
                                      .map((DepartmentListData user) {
                                    return DropdownMenuItem<DepartmentListData>(
                                      value: user,
                                      child: Row(
                                        children: <Widget>[
                                          //user.icon,
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              user.title,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          )],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ):Text("Loading department",style: TextStyle(
                              color: Theme.of(context).indicatorColor,
                              fontSize: 18
                          ),),
                        ],
                      ),

                      CustomDropDownButton(value: Gender,items: [Male, female],hintText: "Select Gender",onChanged: (val){
                        if(val==Male){
                          Gender=val;
                          setState(() {
                            ge="m";
                          });
                          print(ge);
                        }
                        else{
                          setState(() {
                            ge="f";
                          });
                          print(ge);
                        }

                      },),

                      Custom_Submit_Button(
                        text: "Submit",
                        color: darkgrey,

                        onPressed: ()async {

                          final EmployeeStoreDataModel stemp=await StoreEmployee(DepID, DesID, ge, Firstname, lastname, email, contact, employId);
                          print(stemp);
//
//                    Map<String,dynamic > databody={
//                      "first_name":Firstname,
//                      "last_name":lastname,
//                      "email":email,
//                      "gender":gender,
//                      "department_id":department,
//                      "designation_id":designation,
//                      "contact_no":contact,
//                      "employee_id":employId,
//
//
//                    };
//await NetworkServices().postApi(context, empCreateUrl, databody);
//print(databody);

                        },
                      ),
                    ],
                  );
                }
              })
          ),
        ),
      ),
    );
  }
}