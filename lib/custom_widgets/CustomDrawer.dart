
import 'file:///E:/projects/califace/lib/califacescreen/departments/Screens/DepartmentHomeScreen.dart';
import 'package:califace/Login.dart';
import 'package:califace/califacescreen/HomeScreen.dart';
import 'package:califace/califacescreen/attandance/Screens/AttandanceHomeScreen.dart';
import 'package:califace/califacescreen/cameras/Screens/CameraHomeScreen.dart';
import 'package:califace/califacescreen/cameras/mywidgets/CameraSingleton.dart';
import 'package:califace/califacescreen/departments/mywidgets/DepartmentSingleton.dart';
import 'package:califace/califacescreen/designations/Screens/DesignationHomeScreen.dart';
import 'package:califace/califacescreen/designations/mywidgets/SingletonData.dart';
import 'package:califace/califacescreen/employees/Screens/EmployeeHomeScreen.dart';
import 'package:califace/califacescreen/employees/mywidgets/EmployeSingleton.dart';
import 'package:califace/califacescreen/visitors/Screens/VisitorsHomeScreen.dart';
import 'package:califace/thems/ThemeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
//                decoration: BoxDecoration(
//                    image: DecorationImage(
//                        image: AssetImage("assets/images/logo.png"),
//                        
//                    )`
//                ),
                child: Row(
                  children: <Widget>[
                    Image(image: AssetImage("assets/images/logo.png")),
                    Padding(padding: EdgeInsets.only(left: 4 ),child: Text("Califace",style: TextStyle(fontSize: 35,color:Theme.of(context).indicatorColor,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),))
                  ],
                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){

                    return HomeScreen();
                  }));
                },
                title: Text("Dashboard",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward),
              ),
              Divider(),
             ExpansionTile(title: Text("Employee",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[
               ListTile(
                 contentPadding: EdgeInsets.only(left: 5),
                 onTap: (){
                   EmployeeSingleton employeeSingleton=EmployeeSingleton();
                   employeeSingleton.id=null;
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return EmployeeHomeScreen(1);
                   }));
                 },
                 title: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text("Add Employee",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                 ),
               ),
               ListTile(
                 contentPadding: EdgeInsets.only(left: 5),
                 onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeHomeScreen(0))),
                 title: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text("All Employee",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                 ),
               )
             ],),
              Divider(),
              ExpansionTile(title: Text("Designation",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  onTap: (){
                    IdSingleton idSingleton=IdSingleton();
                    idSingleton.id=null;
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DesignationHomeScreen(whichscreen: 1);
                    }));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add Designation",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DesignationHomeScreen(whichscreen: 0,);
                    }));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("All Designation",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                  ),
                )
              ],),
              Divider(),
              ExpansionTile(title: Text("Department",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  onTap: (){
                    DepartmentSingleton departmentSingleton=DepartmentSingleton();
                    departmentSingleton.id=null;
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DepartmentHomeScreen(whichscreen: 1,);
                    }));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add Department",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DesignationHomeScreen(whichscreen: 0,);
                    }));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("All Department",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                  ),
                )
              ],),

              Divider(),
              ExpansionTile(title: Text("Cameras",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  onTap: (){
                    CameraSingleton cameraSingleton=CameraSingleton();
                    cameraSingleton.id=null;
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CameraHomeScreen(whichscreen: 1,);
                    }));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add Camera",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CameraHomeScreen(whichscreen: 0,);
                    }));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("All Cameras",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                  ),
                )
              ],),
              Divider(),
              ExpansionTile(title: Text("Attandance",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[

                ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AttandanceHomeScreen();
                    }));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Todays Attandance",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                  ),
                )
              ],),
              Divider(),
              ExpansionTile(title: Text("Visitors",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return VisitorsHomeScreen(whichscreen: 0,);
                    }));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("All Visitors",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return VisitorsHomeScreen(whichscreen: 1,);
                    }));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Today Visitors",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20)),
                  ),
                ),

              ],),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.only(left: 5),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Settings",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ThemeScreen()));
                },
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.only(left: 5),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Logout",style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: ()async
                {
                  SharedPreferences prefs = await SharedPreferences.getInstance() ;
                  prefs.setBool("login", true);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){

                    return login();
                  }));
                },
              ),


            ],
          ),
        ),

    );

  }
}
