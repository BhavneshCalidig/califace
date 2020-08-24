import 'package:califace/califacescreen/departments/Model/DepartmentItemDeleteModel.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DepListItem extends StatelessWidget{

  DepListItem({this.Name,this.about,this.email,this.Hod,this.date,this.phNo,this.totalEmployee,this.Id});
//  final NetworkImage networkImage;
  final String Name;
  final String about;
  final String Hod;
  final String phNo;
  final String email;
  final String date;
  final String totalEmployee;
  final int Id;



  @override
  Widget build(BuildContext context) {
    Future<DepartmentItemDeleteModel> deleteDepartment(int Id) async{
      Map<String,dynamic > databody={
        "id": Id,

      };
      var Networkhelper=NetworkServices().postApi(context, departmentDestroyUrl, databody);
      return DepartmentItemDeleteModel.fromJson(Networkhelper);
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
                              title: Text( "Name : $Name",

                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),

                            ),
                            Divider(
                              height: 2,
                            ),
                            ListTile(
                              title: Text(
                                "Hod : $Hod",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),

                            ),
                            Divider(
                              height: 2,
                            ),
                            ListTile(
                              title: Text(
                                'Phone no : $phNo',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),

                            ),
                            Divider(
                              height: 2,
                            ),
                            ListTile(
                              title: Text(
                                'Email : $email',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              height: 2,
                            ),


                            ListTile(
                              title: Text(
                                'Starting Date : $date',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),

                            ),
                            ListTile(
                              title: Text(
                                'Total Employees : $totalEmployee',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),

                            ),


                          ],

                        )),
                  );});
          },


          title: Text(Name),
          subtitle: Text(about),
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
            DepartmentItemDeleteModel didm= await deleteDepartment(Id);
            return Navigator.pop(context);

          },
        ),
      ],
    );
  }
  }

