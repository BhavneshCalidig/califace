import 'package:flutter/material.dart';

import 'mywidgets/CamListitem.dart';

class CameraListScren extends StatefulWidget {
  @override
  _CameraListScrenState createState() => _CameraListScrenState();
}

class _CameraListScrenState extends State<CameraListScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return CamListItem();
            }),
      ),
    );
  }
}
