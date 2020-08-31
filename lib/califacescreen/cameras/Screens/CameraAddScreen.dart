import 'package:califace/califacescreen/cameras/Models/CameraStoreModel.dart';
import 'package:califace/califacescreen/cameras/Models/CameraUpdateDataModel.dart';
import 'package:califace/califacescreen/cameras/Models/CameraUpdateModel.dart';
import 'package:califace/califacescreen/cameras/mywidgets/CameraSingleton.dart';

import 'package:califace/custom_widgets/CustomDropDownButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/custom_widgets/Custom_Submit_Button.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CameraAddScreen extends StatefulWidget {

  @override
  _CameraAddScreenState createState() => _CameraAddScreenState();
}

class _CameraAddScreenState extends State<CameraAddScreen> {
String CameraIP;
String Protocol;
String Port;
String Status;
String Id;
var camerip=TextEditingController();
var port=TextEditingController();

CameraUpdateDataModel UpdateList;
Future<CameraUpdateDataModel> _cameraupdateDataModel;

CeateUser(String CameraIP, String Protocol,String Port, String Status)async{
Map<String,dynamic > databody={
  "camera_ip": CameraIP,
  "status": Status,
  "protocol": Protocol,
  "port": Port
};
Map<String,dynamic> Response=await NetworkServices().postApi(context,cameraStoreUrl, databody);
return(CameraStoreModel.fromJson(Response));

}
UpdateCamera(String Id,String CameraIP, String Protocol,String Port, String Status)async{
  Map<String,dynamic > databody={
    "camera_ip": CameraIP,
    "id":Id,
    "status": Status,
    "protocol": Protocol,
    "port": Port
  };
try{
Map<String,dynamic> Response=await NetworkServices().postApi(context,cameraUpdateUrl, databody);

  return(CameraUpdateModel.fromJson(Response));
}
catch(e){
  print(e);
}

}
Future<CameraUpdateDataModel> getData()async{
  Map<String,dynamic> response = await NetworkServices().getApi(context, cameraUpdateDataUrl+Id);
  UpdateList = CameraUpdateDataModel.fromJson(response);
  return UpdateList;
}
getID(){
  CameraSingleton cameraSingleton=CameraSingleton();
  return Id=cameraSingleton.id;
}

@override
  void initState() {
    getID();
    _cameraupdateDataModel = getData();
    super.initState();}

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
          child: FutureBuilder<CameraUpdateDataModel>(
            future: _cameraupdateDataModel,
            builder: (context,snapshots){
              if(snapshots.hasData){
                var item=snapshots.data.cameraData;
                camerip.text=item.cameraIp;
                port.text=item.port;
                return Column(
                  children: <Widget>[
                    CustomTextField(
                      controller: camerip,
                      labelText: "Camera IP",
                      onChanged: (Value) {
                        setState(() {
                          camerip=Value;
                        });
                        // value=Value.toString();
                        print(Value.toString());
                      },
                      validate: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDropDownButton(hintText: "Protocol",

                      items: ["http","rtsp"],

                      onChanged: (val){
                        if(val=="http"){
                          setState(() {
                            Protocol=val.toString();

                          });
                          print(Protocol);

                        }
                        else{
                          setState(() {
                            Protocol=val.toString();

                          });
                          print(Protocol);
                        }

                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(controller:  port,labelText: "Port",onChanged: (Value) {
                      // value=Value.toString();
                      setState(() {
                        port=Value;

                      });
                      print(Value.toString());
                    },validate: true,),


                    SizedBox(
                      height: 10,
                    ),
                    CustomDropDownButton(

                      hintText: "Status",onChanged: (val){
                      if(val=="In"){
                        setState(() {
                          Status="1";
                        });

                      }
                      else{
                        setState(() {
                          Status="0";
                        });
                      }
                    },items: ["In","Out"],
                    ),


                    Custom_Submit_Button(

                      text: "Submit",
                      onPressed: () async{
                        CameraIP=camerip.text;
                        Port=port.text;
                        print(Protocol);
                        print(Status);
//                        final CameraStoreModel csm= await CeateUser(CameraIP,Protocol,Port,Status);
                          CameraUpdateModel cusm=await UpdateCamera(Id, CameraIP, Protocol, Port, Status);
//                          if(cusm.success==true){
//                            return Fluttertoast.showToast(msg: "Succes",
//                                toastLength: Toast.LENGTH_LONG,
//                                gravity: ToastGravity.CENTER,
//                                timeInSecForIosWeb: 1,
//
//                                backgroundColor: Colors.red,
//                                textColor: Colors.white,
//                                fontSize: 16.0);
//                          }
//                          else{
//                            return Fluttertoast.showToast(msg: "failed"
//                            , toastLength: Toast.LENGTH_LONG,
//                                gravity: ToastGravity.CENTER,
//                                timeInSecForIosWeb: 1,
//                                backgroundColor: Colors.red,
//                                textColor: Colors.white,
//                                fontSize: 16.0);
//                          }

                      },
                    ),
                  ],
                );
              }
              else{
                return Column(
                  children: <Widget>[
                    CustomTextField(

                      labelText: "Camera IP",
                      onChanged: (Value) {
                        setState(() {
                          CameraIP=Value.toString();
                        });
                        // value=Value.toString();
                        print(Value.toString());
                      },
                      validate: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDropDownButton(hintText: "Protocol",

                      items: ["http","rtsp"],

                      onChanged: (val){
                        if(val=="http"){
                          setState(() {
                            Protocol=val.toString();

                          });
                          print(Protocol);

                        }
                        else{
                          setState(() {
                            Protocol=val.toString();

                          });
                          print(Protocol);
                        }

                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(labelText: "Port",onChanged: (Value) {
                      // value=Value.toString();
                      setState(() {
                       Port=Value.toString();

                      });
                      print(Value.toString());
                    },validate: true,),


                    SizedBox(
                      height: 10,
                    ),
                    CustomDropDownButton(

                      hintText: "Status",onChanged: (val){
                      if(val=="In"){
                        setState(() {
                          Status="1";
                        });

                      }
                      else{
                        setState(() {
                          Status="0";
                        });
                      }
                    },items: ["In","Out"],
                    ),


                    Custom_Submit_Button(

                      text: "Submit",
                      onPressed: () async{

                        print(Protocol);
                        print(Status);
                        final CameraStoreModel csm= await CeateUser(CameraIP,Protocol,Port,Status);
//                        CameraUpdateModel cusm=await UpdateCamera(Id, CameraIP, Protocol, Port, Status);
//                          if(cusm.success==true){
//                            return Fluttertoast.showToast(msg: "Succes",
//                                toastLength: Toast.LENGTH_LONG,
//                                gravity: ToastGravity.CENTER,
//                                timeInSecForIosWeb: 1,
//
//                                backgroundColor: Colors.red,
//                                textColor: Colors.white,
//                                fontSize: 16.0);
//                          }
//                          else{
//                            return Fluttertoast.showToast(msg: "failed"
//                            , toastLength: Toast.LENGTH_LONG,
//                                gravity: ToastGravity.CENTER,
//                                timeInSecForIosWeb: 1,
//                                backgroundColor: Colors.red,
//                                textColor: Colors.white,
//                                fontSize: 16.0);
//                          }

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
