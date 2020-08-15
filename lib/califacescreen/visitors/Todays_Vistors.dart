import 'package:califace/califacescreen/employees/mywidgets/EmpListItem.dart';
import 'package:flutter/material.dart';

class TodaysVisitors extends StatefulWidget {
  @override
  _TodaysVisitorsState createState() => _TodaysVisitorsState();
}

class _TodaysVisitorsState extends State<TodaysVisitors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return EmpListItem();
            }),
      ),
    );
  }
}
