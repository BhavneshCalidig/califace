import 'package:califace/califacescreen/designations/Models/DesignationEditModel.dart';
import 'package:califace/califacescreen/designations/Models/DesignationStoreModel.dart';
import 'package:califace/califacescreen/designations/Models/DesignationUpdateDataModel.dart';
import 'package:califace/califacescreen/designations/mywidgets/SingletonData.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/custom_widgets/Custom_Submit_Button.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:califace/utill/myfunction.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DesignationAddScreen extends StatefulWidget {
  @override
  _DesignationAddScreenState createState() => _DesignationAddScreenState();
}

class _DesignationAddScreenState extends State<DesignationAddScreen> {



  String Title;
  String Description;

  DesignationUpdateDataModel UpdateDataList;
  var tittle = TextEditingController();
  var Descriptin = TextEditingController();
  String Id;
  String Url;

  Future<DesignationUpdateDataModel> _designationUpdateDataModel;

  void initState() {
    getDesignationSingleTon();
    print(Id);
    super.initState();
  }

  void getDesignationSingleTon() {
    IdSingleton idSingleton = IdSingleton();
    Id = idSingleton.id;
    Url = idSingleton.Url;
    if(Id!=null){
      _designationUpdateDataModel = getDesignationUpdateData();
    }
    else{
      setState(() {
        tittle.text="";
        Descriptin.text="";
      });
    }

  }

  Future<DesignationUpdateDataModel> getDesignationUpdateData() async {
    Map<String, dynamic> NetworkHelper =
        await NetworkServices().getApi(context, Url);
    UpdateDataList = DesignationUpdateDataModel.fromJson(NetworkHelper);
    return UpdateDataList;
  }

  createDesignation(String Title, String Description) async {
    Map<String, dynamic> databody = {
      "title": Title,
      "description": Description
    };
    Map<String, dynamic> Respose =
        await NetworkServices().postApi(context, designationStoreUrl, databody);
   return DesignationStoretModel.fromJson(Respose);
  }

  CeateDesignation(String Title, String Description) async {
    Map<String, dynamic> databody = {
      "title": Title,
      "description": Description
    };
    Map<String, dynamic> Respose =
        await NetworkServices().postApi(context, designationStoreUrl, databody);
    return DesignationStoretModel.fromJson(Respose);
  }

  UpdateDesignation(String Title, String Description, String id) async {
    Map<String, dynamic> databody = {
      "title": Title,
      "id": id,
      "description": Description
    };
    Map<String, dynamic> Respose = await NetworkServices()
        .postApi(context, designationUpdateUrl, databody);
    try {
      DesignationUpdateModel designationUpdateModel =
          DesignationUpdateModel.fromJson(Respose);
      if (designationUpdateModel.success != true) {
        Fluttertoast.showToast(
            msg: "failed",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Succes",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e);
    }
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
          child: FutureBuilder<DesignationUpdateDataModel>(
            future: _designationUpdateDataModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data.data;
                tittle.text = data.title;
                Descriptin.text = data.description;

                return Form(

                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        controller: tittle,
                        labelText: "Title",
                        onChanged: (Value) {
                          setState(() {
                            tittle = Value;
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
                        controller: Descriptin,
                        labelText: "Role and Responsibilities",
                        onChanged: (Value) {
                          setState(() {
                            Descriptin = Value;
                          });
                          // value=Value.toString();
                          print(Value.toString());
                        },
                        validate: true,
                      ),
                      Custom_Submit_Button(
                        text: "Submit",
                        onPressed: () async {
                          Title = tittle.text;
                          Description = Descriptin.text;
                          if(Title ==''|| Description==''){
                            showToast(context, "Field cannot be Empty");
                          }
                          else{
                            final DesignationUpdateModel md =
                            await UpdateDesignation(Title, Description, Id);
                            if(md.success==true){
                              showToast(context, "sucess");
                            }
                          }

//                              final DesignationStoretModel model= await createDesignation(Title, Description);

                        },
                      ),
                    ],
                  ),
                );
              } else {
                return Column(
                  children: <Widget>[
                    CustomTextField(controller: tittle,
                      labelText: "Title",
                      onChanged: (Value) {
                        setState(() {
                          tittle = Value;
                        });
                        // value=Value.toString();
                        print(Value.toString());
                      },
                      validate: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(controller: Descriptin,
                      labelText: "Role and Responsibilities",
                      onChanged: (Value) {
                        setState(() {
                          Descriptin = Value;
                        });
                        // value=Value.toString();
                        print(Value.toString());
                      },
                      validate: true,
                    ),
                    Custom_Submit_Button(
                      text: "Submit",
                      onPressed: () async {
                        Title = tittle.text;
                        Description = Descriptin.text;
                        print(Title);
                        print(Description);
                        if(Title=="" ||Description== ""){
                          showToast(context, "field cannot be empty");
                        }
                        else{
                          final DesignationStoretModel model = await createDesignation(Title, Description);
                          if(model.success==true){
                            showToast(context, "success");
                          }
                          else{
                            showToast(context, "somethingwent");
                          }

                        }


//                        final DesignationUpdateModel md = await UpdateDesignation(Title, Description, Id);
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
