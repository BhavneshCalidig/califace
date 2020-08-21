import 'package:califace/califacescreen/attandance/mywidgeet/AttandanceListItem.dart';

import 'package:flutter/material.dart';

class AttandanceListScreen extends StatefulWidget {
  @override
  _AttandanceListScreenState createState() => _AttandanceListScreenState();
}

class _AttandanceListScreenState extends State<AttandanceListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return AttandanceListItem();
            }),
      ),
    );
  }
}
