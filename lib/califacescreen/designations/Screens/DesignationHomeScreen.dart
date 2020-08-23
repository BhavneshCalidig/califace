import 'file:///E:/projects/califace/lib/califacescreen/cameras/Screens/CameraListScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/designations/Screens/DesignationAddScreen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/designations/Screens/DesignationListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class DesignationHomeScreen extends StatefulWidget {
  @override
  DesignationHomeScreenState createState() => DesignationHomeScreenState();
}

class DesignationHomeScreenState extends State<DesignationHomeScreen>
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
        title: new Text("Designation"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            new Tab(
              icon: new Icon(Icons.format_list_bulleted),text: "All Designations",),
            new Tab(icon: new Icon(Icons.add),text: "Add Designation",
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
          DesignationListScren(),
DesignationAddScreen(),

        ],
        controller: _tabController,
      ),
    );
  }
}