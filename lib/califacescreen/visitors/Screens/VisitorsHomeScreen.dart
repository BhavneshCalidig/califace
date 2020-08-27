
import 'file:///E:/projects/califace/lib/califacescreen/visitors/Screens/AllVisitor_Screen.dart';
import 'file:///E:/projects/califace/lib/califacescreen/visitors/Screens/Todays_Vistors.dart';
import 'package:flutter/material.dart';

class VisitorsHomeScreen extends StatefulWidget {
  final int whichscreen;
  VisitorsHomeScreen({this.whichscreen});
  @override
  _VisitorsHomeScreenState createState() => _VisitorsHomeScreenState();
}

class _VisitorsHomeScreenState extends State<VisitorsHomeScreen>
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
        title: new Text("Visitors"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            new Tab(
              icon: new Icon(Icons.format_list_bulleted),text: "All Vistors",),
            new Tab(icon: new Icon(Icons.add),text: "Todays Visitor",
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
          AllVisitor_Screen(),
         TodaysVisitors()
        ],
        controller: _tabController,
      ),
    );
  }
}
