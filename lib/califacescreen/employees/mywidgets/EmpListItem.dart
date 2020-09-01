import 'package:califace/califacescreen/employees/Models/EmployeeDeleteModel.dart';
import 'package:califace/califacescreen/employees/Screens/EmployeeHomeScreen.dart';
import 'package:califace/califacescreen/employees/mywidgets/EmployeSingleton.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EmpListItem extends StatelessWidget{
  EmpListItem({this.Id,this.gender,this.email,this.Department,this.lasttname,this.Firstname,this.networkImage,this.EmployeeID,this.Conatct,this.Designation});
  final String networkImage;
  final String Firstname;
final String lasttname;
final String Department;
  final String Designation;
  final String Conatct;
  final String EmployeeID;
  final String gender;
  final String email;
  final String Id;

  @override
  Widget build(BuildContext context) {

    Future<EmployeeDeleteModel> deleteemployee(String Id) async{
      Map<String,dynamic > databody={
        "id": Id,

      };
      var Networkhelper=NetworkServices().postApi(context, empDestroyUrl, databody);
      return EmployeeDeleteModel.fromJson(Networkhelper);
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
                                    "Department : $Department",
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
//                                ListTile(
//                                  title: Text(
//                                    'gender : $gender',
//                                    style: TextStyle(
//                                        color: Colors.white, fontWeight: FontWeight.bold),
//                                  ),
//
//                                ),
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
          title: Text((Firstname+" "+lasttname)),
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
          onTap: () {
            EmployeeSingleton e=EmployeeSingleton();
            e.id=Id;
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return EmployeeHomeScreen(1);
            }));
          },
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async{
            EmployeeDeleteModel didm= await deleteemployee(Id);
            return didm;

          },
        ),
      ],
    );
  }
}
