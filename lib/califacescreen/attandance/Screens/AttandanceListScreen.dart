import 'package:califace/califacescreen/attandance/Models/AttandanceListModel.dart';
import 'package:califace/califacescreen/attandance/mywidgeet/AttandanceListItem.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';

import 'package:flutter/material.dart';

class AttandanceListScreen extends StatefulWidget {
  @override
  _AttandanceListScreenState createState() => _AttandanceListScreenState();
}

class _AttandanceListScreenState extends State<AttandanceListScreen> {

  AttandanceListModel attandanceList;
  Future<AttandanceListModel> _attandanceListModel;
  @override
  void initState() {
    _attandanceListModel=getData();
    // TODO: implement initState
    super.initState();
  }
 Future<AttandanceListModel> getData()async{
   Map<String,dynamic> NetworkHelper= await NetworkServices().getApi(context, attandanceListUrl,);
    attandanceList = AttandanceListModel.fromJson(NetworkHelper);
    return attandanceList;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: FutureBuilder<AttandanceListModel>(
          future: _attandanceListModel,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.attandanceData.length,
                  itemBuilder: (context, index) {
                    var Item=snapshot.data.attandanceData[index];
                    return AttandanceListItem(Firstname: Item.firstName,lasttname: Item.lastName,Department: Item.department.toString(),networkImage: Item.img,);
                  });
            }
            else{
              return Center(child: Text("No Data TO Show"));
            }

          },

        ),
      ),
    );
  }
}
