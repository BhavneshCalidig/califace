


import 'package:califace/califacescreen/departments/Model/DepartmentListData_Model.dart';
import 'package:califace/califacescreen/departments/mywidgets/DepListItem.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

class DepartmentListScreen extends StatefulWidget {
  @override
  _DepartmentListScreenState createState() => _DepartmentListScreenState();
}

class _DepartmentListScreenState extends State<DepartmentListScreen> {
  var NetworkHelper;
  var DepartmentList=null;
  Future<DepartmentListDataModel> _dldm;
  @override
  void initState() {
    _dldm =getData() ;
    super.initState();

  }
  Future<DepartmentListDataModel> getData()async{
    NetworkHelper= await NetworkServices().getApi(context, departmentListUrl,);
    DepartmentList =DepartmentListDataModel.fromJson(NetworkHelper);
    print(DepartmentList);
    return DepartmentList;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder<DepartmentListDataModel>(
        future: _dldm,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (context, index) {
                  var data=snapshot.data.data[index];
                  return DepListItem(Name: data.title.toString(),about: data.description.toString(),Hod: data.hod,email: data.email,date: data.startingDate,phNo: data.phone,totalEmployee: data.totalEmployee,Id: data.id.toString(),);
                });
          }
          else{
            return Center(child: CircularProgressIndicator());
          }

        },

      ),
    );
  }
}
