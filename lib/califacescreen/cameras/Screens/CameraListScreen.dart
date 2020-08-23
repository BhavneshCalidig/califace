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
  var NetworkHelper;
  var CameraList;
  Future<CameraListModel> _clm;
  @override
  void initState() {
    _clm=getData();
    super.initState();
  }
  Future<CameraListModel> getData()async{
    NetworkHelper= await NetworkServices().getApi(context, cameraListUrl,);
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
          future: _clm,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var data=snapshot.data.data[index];
                    return CamListitem(title: data.cameraIp.toString(),subtittle: data.status.toString(),);
                  });
            }
            else{
              return Center(child: CircularProgressIndicator());
            }

          },

        ),
      ),
    );
  }
}
