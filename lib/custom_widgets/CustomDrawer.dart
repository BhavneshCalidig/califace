import 'package:califace/califacescreen/attandance/AttandanceListScreen.dart';
import 'package:califace/califacescreen/cameras/CameraAddScreen.dart';
import 'package:califace/califacescreen/cameras/CameraListScreen.dart';
import 'package:califace/califacescreen/departments/DepartmentAddScreen.dart';
import 'package:califace/califacescreen/departments/DepartmentHomeScreen.dart';
import 'package:califace/califacescreen/departments/DepartmentListScreen.dart';
import 'package:califace/califacescreen/designations/DesignationAddScreen.dart';
import 'package:califace/califacescreen/designations/DesignationListScreen.dart';
import 'package:califace/califacescreen/employees/EmployeeAddScreen.dart';
import 'package:califace/califacescreen/employees/EmployeeListScreen.dart';
import 'package:califace/califacescreen/visitors/mywidgets/VisitorsListItem.dart';
import 'package:califace/thems/ThemeScreen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Drawer(

        child: Scaffold(
          backgroundColor:  Theme.of(context).primaryColor,
          body: ListView(

            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/iottechsoftware.png"),
                        fit: BoxFit.contain
                    )
                ),
                child: Text("Hi Everyone"),
              ),
              ListTile(
                title: Text("Dashboard",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward),
              ),
              Divider(),
             ExpansionTile(title: Text("Employee",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[
               ListTile(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return EmployeeAddScreen();
                   }));
                 },
                 title: Text("Add Employee",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
               ),
               ListTile(
                 onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeListScreen())),
                 title: Text("All Employee",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
               )
             ],),
              Divider(),
              ExpansionTile(title: Text("Designation",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DesignationAddScreen();
                    }));
                  },
                  title: Text("Add Designation",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DesignationListScren();
                    }));
                  },
                  title: Text("All Designation",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                )
              ],),
              Divider(),
              ExpansionTile(title: Text("Department",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DepartmentAddScreen();
                    }));
                  },
                  title: Text("Add Department",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DepartmentListScreen();
                    }));
                  },
                  title: Text("All Department",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                )
              ],),

              Divider(),
              ExpansionTile(title: Text("Cameras",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CameraAddScreen();
                    }));
                  },
                  title: Text("Add Camera",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CameraListScren();
                    }));
                  },
                  title: Text("All Cameras",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                )
              ],),
              Divider(),
              ExpansionTile(title: Text("Attandance",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[

                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AttandanceListScreen();
                    }));
                  },
                  title: Text("Todays Attandance",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                )
              ],),
              Divider(),
              ExpansionTile(title: Text("Visitors",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return VisitorsListItem();
                    }));
                  },
                  title: Text("Today Visitors",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                ),

              ],),
              Divider(),
              ListTile(
                title: Text("Settings",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ThemeScreen()));
                },
              ),


            ],
          ),
        ),

    );

  }
}
