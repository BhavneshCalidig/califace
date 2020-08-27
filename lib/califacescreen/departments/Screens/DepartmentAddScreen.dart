import 'package:califace/califacescreen/departments/Model/DepartmentStoreData_Model.dart';
import 'package:califace/califacescreen/departments/Model/DepartmentUpdateDataModel.dart';
import 'package:califace/califacescreen/departments/Model/DepartmentUpdateModel.dart';
import 'package:califace/califacescreen/departments/mywidgets/DepartmentSingleton.dart';

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
var NetworkHelper;
var updateList;
String Id;
String Url;
Future<DepartmentUpdateDataModel> _dupdm;
var department =TextEditingController();
var hod =TextEditingController();
var email =TextEditingController();
var contact =TextEditingController();
var date =TextEditingController();
var totalEmploye =TextEditingController();
var about=TextEditingController();
@override
void initState() {

  getId();
  print(Id);
  print(Url);

  super.initState();
  _dupdm=getdata();
}

void getId(){
  DepartmentSingleton departmentSingleton =DepartmentSingleton();
  Id=departmentSingleton.id;
  Url= departmentSingleton.Url;
}

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
Future<DepartmentUpdateModel>updateDepartment (String id,String About,String Email,String Hod,String Contact,String Date,String Deaprtment,String TotalEmploye)async{
  Map<String,dynamic > databody={
    "description": About,
    "email": Email,
    "hod": Hod,
    "id": id,
    "phone": Contact,
    "starting_date": Date,
    "title": Deaprtment,
    "total_employee": TotalEmploye,
  };

  var Respose=await NetworkServices().postApi(context, departmentUpdateUrl, databody);
  return DepartmentUpdateModel.fromJson(Respose);
}
 Future<DepartmentUpdateDataModel>getdata()async{
   var networkHelper=await NetworkServices().getApi(context, Url);
   updateList=DepartmentUpdateDataModel.fromJson(networkHelper);
   return updateList;
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
          child: FutureBuilder<DepartmentUpdateDataModel>(
            future: _dupdm,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                var data=snapshot.data.data;
               department.text=data.title;
               about.text=data.description;
               hod.text=data.hod;
               email.text=data.email;
               date.text=data.startingDate;
               contact.text=data.phone;
               totalEmploye.text=data.totalEmployee;

                return   Column(
                  children: <Widget>[
                    CustomTextField(
                      controller: department,
                      labelText: "Department Name",
                      onChanged: (Value) {
                        setState(() {
                          department=Value;
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
                      controller: hod,
                      labelText: "Head of Department",
                      onChanged: (Value) {
                        setState(() {
                          hod=Value;
                        });
                        // value=Value.toString();
                        print(Value.toString());
                      },
                      validate: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(controller: email,labelText: "Email",hintText: "Email",onChanged: (Value) {
                      // value=Value.toString();
                      setState(() {
                        email=Value;
                      });
                      print(Value.toString());
                    },validate: true,),


                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(controller: contact,labelText: "Contact",hintText: "Contact No:",onChanged: (Value) {
                      setState(() {
                        contact=Value;
                      });
                      // value=Value.toString();
                      print(Value.toString());
                    },validate: true,),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(controller: date,labelText: "Starting Date:",hintText: "Starting Date",onChanged: (Value) {
                      // value=Value.toString();
                      setState(() {
                        date=Value;
                      });
                      print(Value.toString());
                    },validate: true,),

                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(controller:totalEmploye,labelText: "Total Employee",hintText: "Total Employee",onChanged: (Value) {
                      setState(() {
                        totalEmploye=Value;
                      });
                      // value=Value.toString();
                      print(Value.toString());
                    },validate: true,),
                    CustomTextField(controller: about,labelText: "About",hintText: "More About Department",onChanged: (Value) {
                      // value=Value.toString();
                      setState(() {
                        about=Value;
                      });
                      print(Value.toString());
                    },validate: true,),



                    Custom_Submit_Button(
                      text: "Submit",
                      onPressed: () async{
                        Deaprtment=department.text;
                        Hod=hod.text;
                        Email=email.text;
                        Contact=contact.text;
                        Date=date.text;
                        About=about.text;
                        TotalEmploye=totalEmploye.text;
//                        final DepartmentStoreDataModel model= await StoreDepartment(About, Email, Hod, Contact, Date, Deaprtment, TotalEmploye);
//                        print(model);
                       final DepartmentUpdateModel md= await updateDepartment(Id, About, Email, Hod, Contact, Date, Deaprtment, TotalEmploye);
                      },
                    ),
                  ],
                );

              }
              else{
                return Center(child: CircularProgressIndicator());
              }

            },

          ),
        ),
      ),
    );
  }
}
