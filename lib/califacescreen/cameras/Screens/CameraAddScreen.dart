import 'package:califace/califacescreen/cameras/Models/CameraStoreModel.dart';
import 'package:califace/califacescreen/cameras/Models/CameraUpdateDataModel.dart';
import 'package:califace/califacescreen/cameras/Models/CameraUpdateModel.dart';
import 'package:califace/califacescreen/cameras/mywidgets/CameraSingleton.dart';
import 'package:califace/custom_widgets/CustomButtonRc.dart';
import 'package:califace/custom_widgets/CustomDropDownButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:califace/custom_widgets/Custom_Submit_Button.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

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
var response;
var UpdateList;
Future<CameraUpdateDataModel> _cudm;

Future<CameraStoreModel>CeateUser(String CameraIP, String Protocol,String Port, String Status)async{
Map<String,dynamic > databody={
  "camera_ip": CameraIP,
  "status": Status,
  "protocol": Protocol,
  "port": Port
};
var Response=await NetworkServices().postApi(context,cameraStoreUrl, databody);
return(CameraStoreModel.fromJson(Response));

}
Future<CameraUpdateModel>UpdateCamera(String Id,String CameraIP, String Protocol,String Port, String Status)async{
  Map<String,dynamic > databody={
    "camera_ip": CameraIP,
    "id":Id,
    "status": Status,
    "protocol": Protocol,
    "port": Port
  };
  var Response=await NetworkServices().postApi(context,cameraUpdateUrl, databody);
  return(CameraUpdateModel.fromJson(Response));

}
Future<CameraUpdateDataModel>getData()async{
  response= await NetworkServices().getApi(context, cameraUpdateDataUrl+Id);
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
    _cudm=getData();
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
          child: FutureBuilder<CameraUpdateDataModel>(
            future: _cudm,
            builder: (context,snapshots){
              if(snapshots.hasData){
                var data=snapshots.data.data;
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
//                        final CameraStoreModel csm= await CeateUser(CameraIP,Protocol,Port,Status);
                          CameraUpdateModel cusm=await UpdateCamera(Id, CameraIP, Protocol, Port, Status);

                      },
                    ),
                  ],
                );
              }
              else{
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
