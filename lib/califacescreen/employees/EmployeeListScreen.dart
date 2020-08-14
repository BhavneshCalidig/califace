import 'package:califace/califacescreen/employees/mywidgets/EmpListItem.dart';
import 'package:flutter/material.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
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
