import 'dart:io';
import 'dart:typed_data';
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
import 'package:califace/utill/myfunction.dart';
import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';


class EmployeeAddScreen extends StatefulWidget {
  @override
  _EmployeeAddScreenState createState() => _EmployeeAddScreenState();
}

class _EmployeeAddScreenState extends State<EmployeeAddScreen> {
  var Gender;

  String Male = "Male";
  String female = "Female";
  String ge;
  String DepartmentEmp;
  String DesignationEmp;
  String gender;
  String FirstNameEmp;
  String LastNameEmp;
  String EmailEmp;
  String ContactEmp;
  String EmpIdEmp;
  var DepartmentController = TextEditingController();
  var DesignationController = TextEditingController();
  var geenderController = TextEditingController();
  var firstnameController = TextEditingController();
  var LastnameController = TextEditingController();
  var EmailController = TextEditingController();
  var ContactController = TextEditingController();
  var EmployIdController = TextEditingController();
  String Id;
  String DesID;
  String DepID;
  EmployeeUpdateDataModel Updatelist;
  File _image;
  File _Vdo;
  Uint8List imagefile;
  List<DesignationList> designationlist;
  List<DepartmentListData> departmentlist;
  DepartmentListData dep;
  DesignationList des;
  Future<EmployeeUpdateDataModel> _employeeupdateDataModel;
  Future<DesignationlistModel> _dlm;


  List<File> img;


  Future getimage() async {
    var images = await MultiMediaPicker.pickImages(source: ImageSource.gallery,maxHeight: 70,maxWidth: 70);

    setState(() {
      img = images;
    });
  }


AddMoreImage() async {
    // ignore: deprecated_member_use
    var pic = await MultiMediaPicker.pickImages(
        source: ImageSource.gallery, maxHeight: 70, maxWidth: 70);
setState(() {
  img.addAll(pic);
});

  }

  Future<EmployeeStoreDataModel> StoreEmployee(
    String FirstNameEmp,
    String LastNameEmp,
    String EmailEmp,
    String ContactEmp,
    String EmpIdEmp,
      String DepID,
      String DesID,
      String ge,File _image,

  ) async {
    Map<String, dynamic> databody = {
      "first_name": FirstNameEmp,
      "last_name": LastNameEmp,
      "email": EmailEmp,
      "gender": ge,
      "department_id": DepID,
      "designation_id": DepID,
      "contact_no": ContactEmp,
      "employee_id": EmpIdEmp,
      "file[]" : _image,
    };

    Map<String, dynamic> Respose =
        await NetworkServices().postApi(context, empStoreUrl, databody);
    return EmployeeStoreDataModel.fromJson(Respose);
  }

  UpdateEmployee(
    String Id,
      String FirstNameEmp,
      String LastNameEmp,
      String EmailEmp,
      String ContactEmp,
      String EmpIdEmp,
      String DepID,
      String DesID,
      String ge,
  ) async {
    Map<String, dynamic> databody = {
      "first_name": FirstNameEmp,
      "last_name": LastNameEmp,
      "id": Id,
      "email": EmailEmp,
      "gender": ge,
      "department_id":  DepID,
      "designation_id": DesID,
      "contact_no": ContactEmp,
      "employee_id": EmpIdEmp,
    };

    Map<String, dynamic> Respose =
        await NetworkServices().postApi(context, empUpdateUrl, databody);
    return EmployeeUpdateModel.fromJson(Respose);
  }

  Future<EmployeeUpdateDataModel> getData() async {
    Map<String, dynamic> response =
        await NetworkServices().getApi(context, empUpdateDataUrl + Id);
    Updatelist = EmployeeUpdateDataModel.fromJson(response);
    return Updatelist;
  }

  Future<DepartmentListDataModel> getDepartmentData() async {
    Map<String, dynamic> response =
        await NetworkServices().getApi(context, departmentListUrl);


    setState(() {
      departmentlist =
          DepartmentListDataModel.fromJson(response).departmentListData;
    });

  }

  Future<DesignationlistModel> geData() async {
    Map<String, dynamic> response =
        await NetworkServices().getApi(context, designationListUrl);
    // print("DesignatioN lISt>>> "+response);

     setState(() {
       designationlist = DesignationlistModel.fromJson(response).designationList;
     });


    // return designationlist;
  }

  getEmployeeSingletonID() {
    EmployeeSingleton employeeSingleton = EmployeeSingleton();
    Id = employeeSingleton.id;
    if (Id != null) {
      _employeeupdateDataModel = getData();
    } else {
      DepartmentController.text = "";
      DesignationController.text = "";
      geenderController.text = "";
      firstnameController.text = "";
      LastnameController.text = "";
      EmailController.text = "";
      ContactController.text = "";
      EmployIdController.text = "";
    }
  }

  @override
  void initState() {
    getEmployeeSingletonID();
    print(Id);

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
              child: FutureBuilder<EmployeeUpdateDataModel>(
                  future: _employeeupdateDataModel,
                  builder: (context, snapshots) {
                    if (snapshots.hasData) {
                      var Item = snapshots.data.employeupdateData;
                      firstnameController.text = Item.firstName;
                      LastnameController.text = Item.lastName;
                      EmailController.text = Item.email;
                      EmployIdController.text = Item.employeeId;
                      ContactController.text = Item.contactNo;
                      return Column(
                        children: <Widget>[
                          CustomTextField(
                            controller: firstnameController,
                            labelText: "First Name",
                            onChanged: (Value) {
                              setState(() {
                                firstnameController = Value;
                              });
                              // value=Value.toString();
                              print(Value.toString());
                            },
                            validate: true,
                          ),
                          CustomTextField(
                            controller: LastnameController,
                            labelText: "Last Name",
                            onChanged: (Value) {
                              setState(() {
                                LastnameController = Value;
                              });
                              // value=Value.toString();
                              print(Value.toString());
                            },
                            validate: true,
                          ),
                          CustomTextField(
                            controller: EmailController,
                            labelText: "Email",
                            onChanged: (Value) {
                              setState(() {
                                EmailController = Value;
                              });
                              // value=Value.toString();
                              print(Value.toString());
                            },
                            validate: false,
                          ),
                          CustomTextField(
                            controller: ContactController,
                            labelText: "Contact",
                            onChanged: (Value) {
                              // value=Value.toString();
                              setState(() {
                                ContactController = Value;
                              });
                              print(Value.toString());
                            },
                            validate: true,
                          ),
                          CustomTextField(
                            controller: EmployIdController,
                            labelText: "Employee ID:",
                            onChanged: (Value) {
                              // value=Value.toString();
                              setState(() {
                                EmployIdController = Value;
                              });
                              print(Value.toString());
                            },
                            validate: true,
                          ),
                          Row(
                            children: <Widget>[
                              designationlist != null
                                  ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 3,
                                          )),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        child: DropdownButtonHideUnderline(
                                          child:
                                              DropdownButton<DesignationList>(
                                            isExpanded: true,
                                            hint: Text(
                                              "Select Designation",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .indicatorColor,
                                                  fontSize: 18),
                                            ),
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
                                                DesID = des.id.toString();
                                              });
                                              print(DesID);
                                            },
                                            items: designationlist
                                                .map((DesignationList user) {
                                              return DropdownMenuItem<
                                                  DesignationList>(
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
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Loading Designation",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).indicatorColor,
                                          fontSize: 18),
                                    ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              departmentlist != null
                                  ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 3,
                                          )),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<
                                              DepartmentListData>(
                                            isExpanded: true,
                                            hint: Text(
                                              "Select Department",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .indicatorColor,
                                                  fontSize: 18),
                                            ),
                                            value: dep,
//                            validator: (arg) {
//                              if (arg==null)
//                                return 'Please select Address type';
//                              else
//                                return null;
//                            },
                                            onChanged:
                                                (DepartmentListData Value) {
//
                                              setState(() {
                                                dep = Value;
                                                DepID = dep.id.toString();
                                              });
                                              print(DepID);
                                            },
                                            items: departmentlist
                                                .map((DepartmentListData user) {
                                              return DropdownMenuItem<
                                                  DepartmentListData>(
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
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Loading Department",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).indicatorColor,
                                          fontSize: 18),
                                    ),
                            ],
                          ),
                          CustomDropDownButton(
                            value: Gender,
                            items: [Male, female],
                            hintText: "Select Gender",
                            onChanged: (val) {
                              if (val == Male) {
                                Gender = val;
                                setState(() {
                                  ge = "m";
                                });
                                print(ge);
                              } else {
                                setState(() {
                                  ge = "f";
                                });
                                print(ge);
                              }
                            },
                          ),
                          Container(
                            color: Colors.white,
                            width: 350,
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: IconButton(
                                    icon: Icon(Icons.add_a_photo),
                                    onPressed: () {
                                      return img == null ? getimage() : AddMoreImage();
                                    },
                                  ),
                                ),
//                                _image == null ? Text("no image") : Image.file(_image),

                                img == null ? Text("no image is there") : Container(
                                  height: 100.0,
                                  width: 320.0,
                                  child: ListView.builder(shrinkWrap: true,scrollDirection: Axis.horizontal,itemCount: img.length,itemBuilder: (context,index){
                                    return InkWell(onLongPress: (){
                                      setState(() {print(img[index]);
                                      img.removeAt(index);
                                      });

                                    },child:Image.file(img[index]));
                                  }),
                                )
                              ],
                            ),
                          ),

                          Custom_Submit_Button(
                            text: "Submit",
                            color: darkgrey,
                            onPressed: () async {
                              FirstNameEmp = firstnameController.text;
                              LastNameEmp = LastnameController.text;
                              EmailEmp = EmailController.text;
                              ContactEmp = ContactController.text;
                              EmpIdEmp = EmployIdController.text;
                              if (FirstNameEmp == "" ||
                                  LastNameEmp == "" ||
                                  EmailEmp == "" ||
                                  ContactEmp == "" ||
                                  EmpIdEmp == "" ||
                                  DepID == null ||
                                  DesID == null) {
                                showToast(context, "Field cannot Empty");
                              } else {
                                final EmployeeUpdateModel eum =
                                    await NetworkServices().Updatehttpstreamupload(context, img, FirstNameEmp, Id, LastNameEmp, EmailEmp, ContactEmp, EmpIdEmp, DepID, DesID, ge);

                                print(eum);
//                                if (eum.success == true) {
//                                  showToast(context, "Sucess");
//                                }
                              }
//
//                        final EmployeeStoreDataModel stemp=await StoreEmployee(DepID, DesID, ge, Firstname, lastname, email, contact, employId);
//                        print(stemp);

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
                    } else {
                      return Column(
                        children: <Widget>[
                          CustomTextField(
                            controller: firstnameController,
                            labelText: "First Name",
                            onChanged: (Value) {
                              setState(() {
                                firstnameController = Value;
                              });
                              // value=Value.toString();
                              print(Value.toString());
                            },
                            validate: true,
                          ),
                          CustomTextField(
                            controller: LastnameController,
                            labelText: "Last Name",
                            onChanged: (Value) {
                              setState(() {
                                LastnameController = Value;
                              });
                              // value=Value.toString();
                              print(Value.toString());
                            },
                            validate: true,
                          ),
                          CustomTextField(
                            controller: EmailController,
                            labelText: "Email",
                            onChanged: (Value) {
                              setState(() {
                                EmailController= Value;
                              });
                              // value=Value.toString();
                              print(Value.toString());
                            },
                            validate: true,
                          ),
                          CustomTextField(
                            controller: ContactController,
                            labelText: "Contact",
                            onChanged: (Value) {
                              // value=Value.toString();
                              setState(() {
                                ContactController = Value;
                              });
                              print(Value.toString());
                            },
                            validate: true,
                          ),
                          CustomTextField(
                            controller: EmployIdController,
                            labelText: "Employee ID:",
                            onChanged: (Value) {
                              // value=Value.toString();
                              setState(() {
                                EmployIdController = Value;
                              });
                              print(Value.toString());
                            },
                            validate: true,
                          ),
                          Row(
                            children: <Widget>[
                              designationlist != null
                                  ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 3,
                                          )),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        child: DropdownButtonHideUnderline(
                                          child:
                                              DropdownButton<DesignationList>(
                                            isExpanded: true,
                                            hint: Text(
                                              "Select Designation",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .indicatorColor,
                                                  fontSize: 18),
                                            ),
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
                                                DesID = des.id.toString();
                                              });
                                              print(DesID);
                                            },
                                            items: designationlist
                                                .map((DesignationList user) {
                                              return DropdownMenuItem<
                                                  DesignationList>(
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
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Loading Designation",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).indicatorColor,
                                          fontSize: 18),
                                    ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              departmentlist != null
                                  ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 3,
                                          )),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<
                                              DepartmentListData>(
                                            isExpanded: true,
                                            hint: Text(
                                              "Select Department",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .indicatorColor,
                                                  fontSize: 18),
                                            ),
                                            value: dep,
//                            validator: (arg) {
//                              if (arg==null)
//                                return 'Please select Address type';
//                              else
//                                return null;
//                            },
                                            onChanged:
                                                (DepartmentListData Value) {
//
                                              setState(() {
                                                dep = Value;
                                                DepID = dep.id.toString();
                                              });
                                              print(DepID);
                                            },
                                            items: departmentlist
                                                .map((DepartmentListData user) {
                                              return DropdownMenuItem<
                                                  DepartmentListData>(
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
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Loading Department",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).indicatorColor,
                                          fontSize: 18),
                                    ),
                            ],
                          ),
                          CustomDropDownButton(
                            value: Gender,
                            items: [Male, female],
                            hintText: "Select Gender",
                            onChanged: (val) {
                              if (val == Male) {
                                Gender = val;
                                setState(() {
                                  ge = "m";
                                });
                                print(ge);
                              } else {
                                setState(() {
                                  ge = "f";
                                });
                                print(ge);
                              }
                            },
                          ),
                          Container(
                            color: Colors.white,
                            width: 350,
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: IconButton(
                                    icon: Icon(Icons.add_a_photo),
                                    onPressed: () {
                                      return img == null ? getimage() : AddMoreImage();
                                    },
                                  ),
                                ),
//                                _image == null ? Text("no image") : Image.file(_image),
                                img == null ? Text("no image is Selected") : Container(
                                  height: 100.0,
                                  width: 320.0,
                                  child: ListView.builder(shrinkWrap: true,scrollDirection: Axis.horizontal,itemCount: img.length,itemBuilder: (context,index){
                                    return InkWell(onLongPress: (){
                                     setState(() {print(img[index]);
                                       img.removeAt(index);
                                     });

                                    },child:Image.file(img[index]));
                                  }),
                                )
                              ],
                            ),
                          ),
                          Custom_Submit_Button(
                            text: "Submit",
                            color: darkgrey,
                            onPressed: () async {

                              FirstNameEmp = firstnameController.text;
                              LastNameEmp = LastnameController.text;
                              EmailEmp = EmailController.text.trim();
                              print(EmailEmp);
                              ContactEmp = ContactController.text;
                              EmpIdEmp = EmployIdController.text;
                              if (FirstNameEmp == "" ||
                                  LastNameEmp == "" ||
                                  EmailEmp == "" ||
                                  ContactEmp == "" ||
                                  EmpIdEmp == "" ||
                                  DepID == null ||
                                  DesID == null) {
                                showToast(context, "Field cannot be Empty");
                              } else {
//                                final EmployeeStoreDataModel stemp =
//                                    await StoreEmployee(
//                                        FirstNameEmp,
//                                        LastNameEmp,
//                                        EmailEmp,
//                                        ContactEmp,
//                                        EmpIdEmp,
//                                        DepID,
//                                        DesID,
//                                        ge,
//                                      _image
//                                        );
//                                print(stemp);
//                                if (stemp.success == true) {
//                                  showToast(context, "Sucess");
//                                }
//
EmployeeStoreDataModel emp =await NetworkServices().httpstreamupload(context,img, FirstNameEmp, LastNameEmp, EmailEmp, ContactEmp, EmpIdEmp, DepID, DesID, ge);

                              }
                            },
                          ),
                        ],
                      );
                    }
                  })),
        ),
      ),
    );
  }
}
