import 'package:califace/califacescreen/cameras/Models/CameraStoreModel.dart';
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
String Protocol="";
String Port;
String Status;
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
},value: Status,items: ["In","Out"],
),
             

             Custom_Submit_Button(
                text: "Submit",
                onPressed: () async{
                  print(Protocol);
                  print(Status);
                  final CameraStoreModel csm= await CeateUser(CameraIP,Protocol,Port,Status);


                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
