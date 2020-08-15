import 'package:flutter/material.dart';

import 'mywidgets/DesListitem.dart';



class DesignationListScren extends StatefulWidget {
  @override
  _DesignationListScrenState createState() => _DesignationListScrenState();
}

class _DesignationListScrenState extends State<DesignationListScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return DesListItem();
            }),
      ),
    );
  }
}
