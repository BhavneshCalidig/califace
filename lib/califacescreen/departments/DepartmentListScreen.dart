
import 'package:califace/califacescreen/departments/mywidgets/DepListItem.dart';
import 'package:flutter/material.dart';

class DepartmentListScreen extends StatefulWidget {
  @override
  _DepartmentListScreenState createState() => _DepartmentListScreenState();
}

class _DepartmentListScreenState extends State<DepartmentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return DepListItem();
            }),
      ),
    );
  }
}
