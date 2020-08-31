


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

 DepartmentListDataModel DepartmentList;
  Future<DepartmentListDataModel> _departmentListDataModel;
  @override
  void initState() {
    _departmentListDataModel =getData() ;
    super.initState();

  }
  Future<DepartmentListDataModel> getData()async{
   Map<String,dynamic> NetworkHelper= await NetworkServices().getApi(context, departmentListUrl,);
    DepartmentList =DepartmentListDataModel.fromJson(NetworkHelper);
    print(DepartmentList);
    return DepartmentList;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder<DepartmentListDataModel>(
        future: _departmentListDataModel,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.departmentListData.length,
                itemBuilder: (context, index) {
                  var Item=snapshot.data.departmentListData[index];
                  return DepListItem(Name: Item.title.toString(),about: Item.description.toString(),Hod: Item.hod,email: Item.email,date: Item.startingDate,phNo: Item.phone,totalEmployee: Item.totalEmployee,Id: Item.id.toString(),);
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
