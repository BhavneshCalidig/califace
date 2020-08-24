import 'package:califace/califacescreen/designations/Models/DesignationDeleteItemModel.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class DesListItem extends StatelessWidget{
  DesListItem({this.title,this.subtittle,this.Id});
//  final NetworkImage networkImage;
  final String title;
  final String subtittle;
  final int Id;


  @override
  Widget build(BuildContext context) {
    Future<DesignationItemDeleteModel> deletedesignation(int Id) async{
      Map<String,dynamic > databody={
        "id": Id,

      };
      var Networkhelper=NetworkServices().postApi(context, designationDestroyUrl, databody);
      return DesignationItemDeleteModel.fromJson(Networkhelper);
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
//          leading:CircleAvatar(
//            radius: 30.0,
//            backgroundImage:
//            NetworkImage("$networkImage"),
//            backgroundColor: Colors.transparent,
//          ),
          title: Text(title),
          subtitle: Text(subtittle),
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
          onTap: () => print('Edit'),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async{
           final DesignationItemDeleteModel didm = await deletedesignation(Id);
           return didm;
          },
        ),
      ],
    );
  }
}