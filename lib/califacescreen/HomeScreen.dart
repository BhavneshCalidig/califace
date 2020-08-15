import 'package:califace/califacescreen/employees/EmployeeHomeScreen.dart';
import 'package:califace/califacescreen/visitors/VisitorsHomeScreen.dart';
import 'package:califace/custom_widgets/CustomDrawer.dart';
import 'package:califace/custom_widgets/CustomHomeButton.dart';
import 'package:califace/custom_widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

import 'attandance/AttandanceHomeScreen.dart';
import 'cameras/CameraHomeScreen.dart';
import 'departments/DepartmentHomeScreen.dart';
import 'designations/DesignationHomeScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Califace",style: TextStyle(color: Theme.of(context).accentColor),),
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
                  CustomHomeButton(
                    text: "Employees",
                    size: 150,
                    onpressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeHomeScreen()));
                    },
                  ),
                  CustomHomeButton(
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
                    text: "Designations",
                    size: 150,
                    onpressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DesignationHomeScreen()));
                    },
                  ),
                  CustomHomeButton(
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
                    text: "Attendance",
                    size: 150,
                    onpressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AttandanceHomeScreen()));
                    },
                  ),
                  CustomHomeButton(
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


