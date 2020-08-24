import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class AttandanceListItem extends StatelessWidget{
  AttandanceListItem({this.Department,this.lasttname,this.Firstname,this.networkImage});
  final String networkImage;
  final String Firstname;
  final String lasttname;
  final String Department;

  @override
  Widget build(BuildContext context) {
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
                              title: Text( "Name :",

                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                (Firstname+" "+lasttname),
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              height: 2,
                            ),
                            ListTile(
                              title: Text(
                                "Department",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(Department,

                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            Divider(
                              height: 2,
                            ),
                            ListTile(
                              title: Text(
                                '',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Designation",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            Divider(
                              height: 2,
                            ),
                            ListTile(
                              title: Text(
                                '',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Employee Id",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            Divider(
                              height: 2,
                            ),


                            ListTile(
                              title: Text(
                                '',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Contact",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),

                          ],

                        )),
                  );});
          },
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage:
            NetworkImage("$networkImage"),
            backgroundColor: Colors.transparent,
          ),
          title: Text((Firstname+lasttname)),
          subtitle: Text(Department),
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
          onTap: () => print('Delete'),
        ),
      ],
    );
  }
}