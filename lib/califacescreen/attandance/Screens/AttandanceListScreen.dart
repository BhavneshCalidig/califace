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
  var NetworkHelper;
  var AttandanceList=null;
  Future<AttandanceListModel> _alm;
  @override
  void initState() {
    _alm=getData();
    // TODO: implement initState
    super.initState();
  }
  Future<AttandanceListModel>getData()async{
    NetworkHelper= await NetworkServices().getApi(context, attandanceListUrl,);
    AttandanceList=AttandanceListModel.fromJson(NetworkHelper);
    print(AttandanceList);
    return AttandanceList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: FutureBuilder<AttandanceListModel>(
          future: _alm,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var data=snapshot.data.data[index];
                    return AttandanceListItem(Firstname: data.firstName,lasttname: data.lastName,Department: data.department.toString(),networkImage: data.img,);
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
