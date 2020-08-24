import 'package:califace/califacescreen/designations/Models/DesignationListModel.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

import '../mywidgets/DesListitem.dart';



class DesignationListScren extends StatefulWidget {
  @override
  _DesignationListScrenState createState() => _DesignationListScrenState();
}

class _DesignationListScrenState extends State<DesignationListScren> {
  var NetworkHelper;
  var DesignationList=null;
  Future<DesignationlistModel> _dlm;
  @override
  void initState() {
    // TODO: implement initState
    _dlm=getData();
    super.initState();
  }
  Future<DesignationlistModel> getData()async{
    NetworkHelper= await NetworkServices().getApi(context, designationListUrl,);
    DesignationList =DesignationlistModel.fromJson(NetworkHelper);
    print(DesignationList);
    return DesignationList;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child:FutureBuilder<DesignationlistModel>(
          future: _dlm,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var data=snapshot.data.data[index];
                    return DesListItem(title: data.title,subtittle: data.description.toString(),Id: data.id,);
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
