import 'package:califace/califacescreen/cameras/Models/CameraListModel.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

import '../mywidgets/CamListitem.dart';

class CameraListScren extends StatefulWidget {
  @override
  _CameraListScrenState createState() => _CameraListScrenState();
}

class _CameraListScrenState extends State<CameraListScren> {

  CameraListModel CameraList;
  Future<CameraListModel> _cameralistmodel;
  @override
  void initState() {
    _cameralistmodel=getData();
    super.initState();
  }
  Future<CameraListModel> getData()async{
   Map<String , dynamic> NetworkHelper= await NetworkServices().getApi(context, cameraListUrl,);
    CameraList =CameraListModel.fromJson(NetworkHelper);
    print(CameraList);
    return CameraList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: FutureBuilder<CameraListModel>(
          future: _cameralistmodel,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.cameralist.length,
                  itemBuilder: (context, index) {
                    var Item=snapshot.data.cameralist[index];
                    return CamListitem(CameraIp: Item.cameraIp.toString(),Status: Item.status.toString(),Id: Item.id,Port: Item.port,Protocol:Item.protocol,);
                  });
            }
            else{
              return Center(child: Text("No Data To Show"));
            }

          },

        ),
      ),
    );
  }
}
