import 'file:///E:/projects/califace/lib/califacescreen/attandance/Screens/AttandanceListScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/cameras/Screens/CameraAddScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/cameras/Screens/CameraListScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/departments/Screens/DepartmentAddScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/departments/Screens/DepartmentHomeScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/departments/Screens/DepartmentListScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/designations/Screens/DesignationAddScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/designations/Screens/DesignationListScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/employees/Screens/EmployeeAddScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/employees/Screens/EmployeeListScreen.dart';
import 'package:califace/califacescreen/visitors/Screens/AllVisitor_Screen.dart';
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
                      return AllVisitor_Screen();
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
