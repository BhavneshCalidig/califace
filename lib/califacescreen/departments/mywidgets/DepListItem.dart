import 'package:califace/califacescreen/departments/Model/DepartmentItemDeleteModel.dart';
import 'package:califace/califacescreen/departments/Screens/DepartmentAddScreen.dart';
import 'package:califace/califacescreen/departments/Screens/DepartmentHomeScreen.dart';
import 'package:califace/califacescreen/departments/mywidgets/DepartmentSingleton.dart';
import 'package:califace/califacescreen/designations/mywidgets/SingletonData.dart';
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
  final String Id;



  @override
  Widget build(BuildContext context) {
    Future<DepartmentItemDeleteModel> deleteDepartment(String Id) async{
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
          onTap: () async{
            DepartmentSingleton d=DepartmentSingleton();
            d.id=Id.toString();
            d.Url=departmentUpdateDataUrl+Id.toString();
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DepartmentHomeScreen(whichscreen: 1,);
            }));
          },
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

