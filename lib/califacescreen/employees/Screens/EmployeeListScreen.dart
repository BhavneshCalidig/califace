import 'dart:convert';


import 'package:califace/califacescreen/employees/Models/EmployeeListModel.dart';
import 'package:califace/califacescreen/employees/mywidgets/EmpListItem.dart';
import 'package:califace/califacescreen/employees/mywidgets/EmployeSingleton.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:califace/utill/NetworkServices.dart';
import 'package:flutter/material.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {

 EmployeListData employe;
  Future<EmployeListData> _employeelistData;
  @override
  void initState() {
   _employeelistData=getEmployeeData();
    super.initState();
    EmployeeSingleton employeeSingleton=EmployeeSingleton();
    employeeSingleton.id=null;
  }
 Future<EmployeListData>getEmployeeData()async{
 Map<String,dynamic> NetworkHelper= await NetworkServices().getApi(context, empListUrl,);
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
          future: _employeelistData,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.employelist.length,
                  itemBuilder: (context, index) {
                    var Item = snapshot.data.employelist[index];

                    return EmpListItem(Id: Item.id.toString(),Firstname: Item.firstName,lasttname: Item.lastName,networkImage: Item.img,EmployeeID: Item.employeeId,Conatct: Item.contactNo,Department: Item.department.title,Designation: Item.designation.title,email: Item.email,gender: Item.gender.toString(),);
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
