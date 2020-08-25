import 'package:califace/califacescreen/cameras/Models/CameraDeleteModel.dart';
import 'package:califace/califacescreen/cameras/Screens/CameraAddScreen.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CamListitem extends StatelessWidget{
  CamListitem({this.CameraIp,this.Status,this.Port,this.Protocol,this.Id});
//  final NetworkImage networkImage;
  final String CameraIp;
  final String Status;
  final String Port;
  final String Protocol;
  final int Id;


  @override
  Widget build(BuildContext context) {
    Future<CameraDeleteModel> deleteCamera(int Id) async{
      Map<String,dynamic > databody={
        "id": Id,

      };
      var Networkhelper=NetworkServices().postApi(context, cameraDestroyUrl, databody);
      return CameraDeleteModel.fromJson(Networkhelper);
    }

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),


        child: ListTile(
onTap: (){
  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height ,
          color: Theme.of(context).backgroundColor,

          child: Center(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text( "CameraIP : $CameraIp",

                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),

                  ),
                  Divider(
                    height: 2,
                  ),
                  ListTile(
                    title: Text(
                      "Status : $Status",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),

                  ),
                  Divider(
                    height: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Port : $Port',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),

                  ),
                  Divider(
                    height: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Protocol : $Protocol',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),





                ],

              )),
        );});
},
          title: Text(CameraIp),
          subtitle: Text(Status),
        ),
      ),
//      actions:
//      <Widget>[
//        IconSlideAction(
//          caption: 'Archive',
//          color: Colors.blue,
//          icon: Icons.archive,
//          onTap: () => print('Archive'),
//        ),
//        IconSlideAction(
//          caption: 'Share',
//          color: Colors.indigo,
//          icon: Icons.share,
//          onTap: () => print('Share'),
//        ),
//      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return CameraAddScreen(Id: Id.toString(),Url: cameraUpdateDataUrl+Id.toString(),);
            }));
          },
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async{
          final  CameraDeleteModel cdm= await deleteCamera(Id);
          },
        ),
      ],
    );
  }
}