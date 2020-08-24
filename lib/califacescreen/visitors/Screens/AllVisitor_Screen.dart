import 'package:califace/califacescreen/employees/mywidgets/EmpListItem.dart';
import 'package:califace/califacescreen/visitors/Models/VisitorListModel.dart';
import 'package:califace/califacescreen/visitors/mywidgets/VisitorsListItem.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

class AllVisitor_Screen extends StatefulWidget {

  @override
  _AllVisitor_ScreenState createState() => _AllVisitor_ScreenState();
}

class _AllVisitor_ScreenState extends State<AllVisitor_Screen> {
  var NetworkHelper;
  var VisitorList;
  Future<VisitorListModel> _vlm;
  @override
  void initState() {
    _vlm=getData();
    // TODO: implement initState
    super.initState();
  }
  Future<VisitorListModel> getData() async{
    NetworkHelper= await NetworkServices().getApi(context, visitorsListUrl,);
    VisitorList = VisitorListModel.fromJson(NetworkHelper);
    return VisitorList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: FutureBuilder<VisitorListModel>(
          future: _vlm,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var data=snapshot.data.data[index];
                    return Visitorslistitems(networkImage: data.img,Firstname: data.lastVisitingDate,checkin: data.checkIn,checkOut: data.checkOut,);
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