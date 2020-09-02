import 'file:///E:/projects/califace/lib/califacescreen/employees/Screens/EmployeeHomeScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/visitors/Screens/VisitorsHomeScreen.dart';
import 'package:califace/califacescreen/cameras/mywidgets/CameraSingleton.dart';
import 'package:califace/califacescreen/departments/mywidgets/DepartmentSingleton.dart';
import 'package:califace/califacescreen/designations/mywidgets/SingletonData.dart';
import 'package:califace/califacescreen/employees/mywidgets/EmployeSingleton.dart';
import 'package:califace/custom_widgets/CustomDrawer.dart';
import 'package:califace/custom_widgets/CustomHomeButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

import 'attandance/Screens/AttandanceHomeScreen.dart';
import 'cameras/Screens/CameraHomeScreen.dart';
import 'departments/Screens/DepartmentHomeScreen.dart';
import 'designations/Screens/DesignationHomeScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    singleTonsAllScreens();
    print(singleTonsAllScreens());
    super.initState();
  }
  singleTonsAllScreens(){
    EmployeeSingleton employeeSingleton=EmployeeSingleton();
    employeeSingleton.id=null;
    CameraSingleton cameraSingleton=CameraSingleton();
    cameraSingleton.id=null;
    DepartmentSingleton departmentSingleton=DepartmentSingleton();
    departmentSingleton.id=null;
    IdSingleton idSingleton=IdSingleton();
    idSingleton.id=null;
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Califace",style: TextStyle(color: Theme.of(context).indicatorColor),),
      ),
      drawer: CustomDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomHomeButton(iconData: Icons.sentiment_satisfied,

                    text: "Employees",
                    size: 150,
                    onpressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeHomeScreen(0)));
                    },
                  ),
                  CustomHomeButton(
                    iconData: Icons.sentiment_satisfied,
                    text: "Departments",
                    size: 150,
                    onpressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DepartmentHomeScreen()));
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomHomeButton(
                    iconData: Icons.sentiment_satisfied,
                    text: "Designations",
                    size: 150,
                    onpressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DesignationHomeScreen()));
                    },
                  ),
                  CustomHomeButton( iconData: Icons.sentiment_satisfied,
                    text: "Cameras",
                    size: 150,
                    onpressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraHomeScreen()));
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomHomeButton(

                    iconData: Icons.sentiment_satisfied,
                    text: "Attendance",
                    size: 150,
                    onpressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AttandanceHomeScreen()));
                    },
                  ),

                  CustomHomeButton(
                    iconData: Icons.sentiment_satisfied,
                    text: "Visitors",
                    size: 150,
                    onpressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VisitorsHomeScreen()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


