import 'package:califace/califacescreen/employees/mywidgets/EmpListItem.dart';
import 'package:flutter/material.dart';

class AllVisitor_Screen extends StatefulWidget {
  @override
  _AllVisitor_ScreenState createState() => _AllVisitor_ScreenState();
}

class _AllVisitor_ScreenState extends State<AllVisitor_Screen> {
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