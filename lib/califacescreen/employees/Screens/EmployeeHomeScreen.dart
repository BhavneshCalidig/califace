import 'dart:convert';

import 'file:///E:/projects/califace/lib/califacescreen/employees/Screens/EmployeeAddScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/employees/Screens/EmployeeListScreen.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeeHomeScreen extends StatefulWidget {

 final int whichscreen;

 EmployeeHomeScreen(this.whichscreen);


  @override
  _EmployeeHomeScreenState createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    if(widget.whichscreen==1){
      _tabController.animateTo(1);
      }
    else{
      _tabController.animateTo(0);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Employee"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            new Tab(
                icon: new Icon(Icons.format_list_bulleted),text: "Employee List",),
            new Tab(icon: new Icon(Icons.add),text: "Add Employee",
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          EmployeeListScreen(),
          EmployeeAddScreen(),
        ],
        controller: _tabController,
      ),
    );
  }
}
