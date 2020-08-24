
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EmpListItem extends StatelessWidget{
  EmpListItem({this.gender,this.email,this.Department,this.lasttname,this.Firstname,this.networkImage,this.EmployeeID,this.Conatct,this.Designation});
  final String networkImage;
  final String Firstname;
final String lasttname;
final String Department;
  final String Designation;
  final String Conatct;
  final String EmployeeID;
  final String gender;
  final String email;

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
                                  title: Text( "Name : $Firstname $lasttname",

                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),

                                ),
                                Divider(
                                  height: 2,
                                ),
                                ListTile(
                                  title: Text(
                                    "Department : $EmployeeID",
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),

                                ),
                                Divider(
                                  height: 2,
                                ),
                                ListTile(
                                  title: Text(
                                    'Designation : $Designation',
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),

                                ),
                                Divider(
                                  height: 2,
                                ),
                                ListTile(
                                  title: Text(
                                    'Employee Id : $EmployeeID',
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Divider(
                                  height: 2,
                                ),


                                ListTile(
                                  title: Text(
                                    'Contact : $Conatct',
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),

                                ),
                                ListTile(
                                  title: Text(
                                    'gender : $gender',
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),

                                ),
                                ListTile(
                                  title: Text(
                                    'email : $email',
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
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
