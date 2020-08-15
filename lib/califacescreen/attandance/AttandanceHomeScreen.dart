import 'package:califace/califacescreen/attandance/AttandanceListScreen.dart';
import 'package:califace/califacescreen/employees/EmployeeAddScreen.dart';
import 'package:califace/califacescreen/employees/EmployeeListScreen.dart';
import 'package:flutter/material.dart';

class AttandanceHomeScreen extends StatefulWidget {
  @override
  _AttandanceHomeScreenState createState() => _AttandanceHomeScreenState();
}

class _AttandanceHomeScreenState extends State<AttandanceHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Attandnace"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            new Tab(
              icon: new Icon(Icons.format_list_bulleted),text: "Todays Attandance",),
//            new Tab(icon: new Icon(Icons.add),text: "Add Employee",
//            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
         AttandanceListScreen(),

        ],
        controller: _tabController,
      ),
    );
  }
}
