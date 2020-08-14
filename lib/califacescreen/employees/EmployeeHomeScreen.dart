import 'package:califace/califacescreen/employees/EmployeeAddScreen.dart';
import 'package:califace/califacescreen/employees/EmployeeListScreen.dart';
import 'package:flutter/material.dart';

class EmployeeHomeScreen extends StatefulWidget {
  @override
  _EmployeeHomeScreenState createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
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
