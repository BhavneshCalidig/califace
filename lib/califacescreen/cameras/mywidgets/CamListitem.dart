import 'package:califace/califacescreen/cameras/Models/CameraDeleteModel.dart';
import 'package:califace/califacescreen/cameras/Screens/CameraAddScreen.dart';
import 'package:califace/califacescreen/cameras/Screens/CameraHomeScreen.dart';
import 'package:califace/califacescreen/cameras/mywidgets/CameraSingleton.dart';
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
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height ,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius:  BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
          ),

          child: Center(
              child: Column(

                children: <Widget>[
                  Center(
                    child: IconButton(icon: Icon(Icons.clear), onPressed: (){
                      return Navigator.pop(context);
                    }),
                  ),
                  ListTile(
                    title: Text( "CameraIP : $CameraIp",

                      style: TextStyle(
                          color: Theme.of(context).indicatorColor, fontWeight: FontWeight.bold),
                    ),

                  ),
                  Divider(
                    height: 2,
                  ),
                  ListTile(
                    title: Text(
                      "Status : $Status",
                      style: TextStyle(
                          color: Theme.of(context).indicatorColor, fontWeight: FontWeight.bold),
                    ),

                  ),
                  Divider(
                    height: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Port : $Port',
                      style: TextStyle(
                          color: Theme.of(context).indicatorColor, fontWeight: FontWeight.bold),
                    ),

                  ),
                  Divider(
                    height: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Protocol : $Protocol',
                      style: TextStyle(
                          color: Theme.of(context).indicatorColor, fontWeight: FontWeight.bold),
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
            CameraSingleton c=CameraSingleton();
            c.id=Id.toString();
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return CameraHomeScreen(whichscreen: 1,);
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