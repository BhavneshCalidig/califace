import 'dart:convert';

import 'file:///E:/projects/califace/lib/califacescreen/employees/Models/EmployeeListModel.dart';
import 'package:califace/califacescreen/employees/mywidgets/EmpListItem.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  var NetworkHelper;
  var employe=null;
  Future<EmployeListData> _empd;
  @override
  void initState() {
   _empd=getData();
    super.initState();
  }
 Future<EmployeListData>getData()async{
  NetworkHelper= await NetworkServices().getApi(context, empListUrl,);
 employe =EmployeListData.fromJson(NetworkHelper);
  print(employe);
 return employe;





  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: FutureBuilder<EmployeListData>(
          future: _empd,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var data=snapshot.data.data[index];
                    return EmpListItem(Firstname: data.firstName,lasttname: data.lastName,networkImage: data.img,Department: data.department.toString(),);
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
