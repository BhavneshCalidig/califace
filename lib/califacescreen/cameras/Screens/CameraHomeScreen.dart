import 'file:///E:/projects/califace/lib/califacescreen/cameras/Screens/CameraListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CameraAddScreen.dart';

class CameraHomeScreen extends StatefulWidget {
  final int whichscreen;
  CameraHomeScreen({this.whichscreen});
  @override
  CameraHomeScreenState createState() => CameraHomeScreenState();
}

class CameraHomeScreenState extends State<CameraHomeScreen>
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
        title: new Text("Cameras"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            new Tab(
              icon: new Icon(Icons.format_list_bulleted),text: "All Cameras",),
            new Tab(icon: new Icon(Icons.add),text: "Add Camera",
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
          CameraListScren(),
         CameraAddScreen(),
        ],
        controller: _tabController,
      ),
    );
  }
}