import 'package:califace/califacescreen/designations/Models/DesignationEditModel.dart';
import 'package:califace/califacescreen/designations/Models/DesignationStoreModel.dart';
import 'package:califace/califacescreen/designations/Models/DesignationUpdateDataModel.dart';
import 'package:califace/califacescreen/designations/mywidgets/SingletonData.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/custom_widgets/Custom_Submit_Button.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

class DesignationAddScreen extends StatefulWidget {

  @override
  _DesignationAddScreenState createState() => _DesignationAddScreenState();
}

class _DesignationAddScreenState extends State<DesignationAddScreen> {
String Title;
String Description;
var NetworkHelper;
var UpdateDataList;
 var tittle=TextEditingController();
 var Descriptin=TextEditingController();
String Id;
String Url;

Future<DesignationUpdateDataModel> _dudm;

void initState() {
  getID();
  print(Id);
  _dudm=getData();
  // TODO: implement initState

  super.initState();
}

void getID(){
  IdSingleton idSingleton=IdSingleton();
  Id=idSingleton.id;
  Url =idSingleton.Url;

}
Future<DesignationUpdateDataModel> getData()async{
  NetworkHelper=await NetworkServices().getApi(context, Url);
  UpdateDataList=DesignationUpdateDataModel.fromJson(NetworkHelper);
  return UpdateDataList;

}



Future<DesignationStoretModel> createDesignation(String Title,String Description) async{
  Map<String,dynamic > databody={
    "title": Title,
    "description": Description

  };
  var Respose= await NetworkServices().postApi(context, designationStoreUrl, databody);
  return DesignationStoretModel.fromJson(Respose);

}
Future<DesignationStoretModel> CeateDesignation(String Title,String Description) async{
  Map<String,dynamic > databody={
    "title": Title,
    "description": Description

  };
  var Respose= await NetworkServices().postApi(context, designationStoreUrl, databody);
  return DesignationStoretModel.fromJson(Respose);

}
Future<DesignationUpdateModel> UpdateDesignation(String Title,String Description,String id) async{
  Map<String,dynamic > databody={
    "title": Title,
  	"id" :id,
  "description": Description

  };
  var Respose= await NetworkServices().postApi(context, designationUpdateUrl, databody);
  return DesignationUpdateModel.fromJson(Respose);

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
            future: _dudm,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                var data=snapshot.data.data;
                tittle.text=data.title;
                Descriptin.text=data.description;

                      return  Column(
                        children: <Widget>[
                          CustomTextField(
                            controller:tittle,
                            labelText: "Title",
                            onChanged: (Value) {
                              setState(() {
                                tittle=Value;

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
                                Descriptin=Value;

                              });
                              // value=Value.toString();
                              print(Value.toString());
                            },
                            validate: true,
                          ),

                          Custom_Submit_Button(

                            text: "Submit",
                            onPressed: () async{
                              Title=tittle.text;
                              Description=Descriptin.text;

//                              final DesignationStoretModel model= await createDesignation(Title, Description);
                              final DesignationUpdateModel md=await UpdateDesignation(Title, Description, Id);


                            },
                          ),
                        ],
                      );

              }
              else{
                return Column(
                  children: <Widget>[
                    CustomTextField(

                      labelText: "Title",
                      onChanged: (Value) {
                        setState(() {


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

                      labelText: "Role and Responsibilities",
                      onChanged: (Value) {
                        setState(() {
                          Descriptin=Value;

                        });
                        // value=Value.toString();
                        print(Value.toString());
                      },
                      validate: true,
                    ),

                    Custom_Submit_Button(

                      text: "Submit",
                      onPressed: () async{
                        Title=tittle.text;
                        Description=Descriptin.text;

//                              final DesignationStoretModel model= await createDesignation(Title, Description);
                        final DesignationUpdateModel md=await UpdateDesignation(Title, Description, Id);


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
