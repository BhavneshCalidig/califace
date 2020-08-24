import 'package:califace/califacescreen/employees/mywidgets/EmpListItem.dart';
import 'package:califace/califacescreen/visitors/Models/VisitorModelListToday.dart';
import 'package:califace/califacescreen/visitors/mywidgets/VisitorListItemToday.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

class TodaysVisitors extends StatefulWidget {
  @override
  _TodaysVisitorsState createState() => _TodaysVisitorsState();
}

class _TodaysVisitorsState extends State<TodaysVisitors> {
  var NetworkHelper;
  var VisitorList;
  Future<VisitorListModelToday> _vlm;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future<VisitorListModelToday> getData() async{
    NetworkHelper= await NetworkServices().getApi(context, visitorListToday,);
    VisitorList = VisitorListModelToday.fromJson(NetworkHelper);
    return VisitorList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: FutureBuilder<VisitorListModelToday>(
          future: _vlm,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var data=snapshot.data.data[index];
                    return VisitorListItemToday(Firstname: "No Data TO show",);
                  });
            }
            else{
              return Center(child: CircularProgressIndicator());
            }

          },

        ),
      ),
    );
  }
}
