import 'file:///E:/projects/califace/lib/califacescreen/departments/Screens/DepartmentAddScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DepartmentListScreen.dart';

class DepartmentHomeScreen extends StatefulWidget {
  final int whichscreen;
  DepartmentHomeScreen({this.whichscreen});
  @override
  DepartmentHomeScreenState createState() =>  DepartmentHomeScreenState();
}

class DepartmentHomeScreenState extends State<DepartmentHomeScreen>
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
        title: new Text("Department"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            new Tab(
              icon: new Icon(Icons.format_list_bulleted),text: "Department List",),
            new Tab(icon: new Icon(Icons.add),text: "Add Department",
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
         DepartmentListScreen(),
         DepartmentAddScreen()
        ],
        controller: _tabController,
      ),
    );
  }
}