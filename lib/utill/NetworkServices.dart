import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:califace/califacescreen/employees/Models/EmployeeStoreDataModel.dart';
import 'package:califace/utill/MyApi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'constnts.dart';
import 'myfunction.dart';

class NetworkServices {

  postApi(BuildContext context, String myUrl, Map<String, dynamic>  dataBody) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      print("servicesApi>>");
      showAlertDialog(context);
      http.Response response = await http
          .post(myUrl,
              headers: {
                'Content-Type': 'application/json',
       'Authorization': prefs.get("accesToken"),
          },
              body: jsonEncode(dataBody))
          .timeout(Duration(seconds: api_timeout));


      Navigator.pop(context);
      var jsonres = jsonDecode(response.body);

      print("servicesapi>>> " + jsonres.toString());

      if (response.statusCode == 200) {
        var jsonres = jsonDecode(response.body);
        if (jsonres['success'] == true) {
          Map<String, dynamic> map = jsonDecode(response.body);
          return map;
        }

      } else if(response.statusCode==422){
        var jsonres = jsonDecode(response.body);
        print("validation>>");
        return jsonres;

      } else if (response.statusCode == 400) {

      } else if (response.statusCode == 500) {
        print("statuscod>>500");
      } else if (response.statusCode == 301) {print("statuscod>>301");}
    } on TimeoutException catch (e) {
      Navigator.pop(context);
      showSnakbar(context, exception_message);
      print("Timeout Exception" + e.toString());
    } on SocketException catch (e) {
      Navigator.pop(context);
      showSnakbar(context, exception_message);
      print("Socket Exception" + e.toString());
    } on Exception catch (e) {
      Navigator.pop(context);
      showSnakbar(context, exception_message);
      print("Exception" + e.toString());
    }
  }
getApi(BuildContext context, String myUrl)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      print("servicesApi>>");

      http.Response response = await http.get(myUrl,headers: {
        'Content-Type': 'application/json',
        'Authorization': prefs.get("accesToken"),
      },);

      if(response.statusCode==200){
        var Data = response.body;
//        Map<String,dynamic> map =jsonDecode(Data);
//        EmployeListModel enm=EmployeListModel.fromJson(map);
//        var name=enm.data;




        var decodeData=jsonDecode(Data);

//       var data=decodeData['data'][0]['first_name'];
//        print(Data);


        return decodeData;
      }
      else{print(response.statusCode);}
    }
    on TimeoutException catch (e) {
      Navigator.pop(context);
      showSnakbar(context, exception_message);
      print("Timeout Exception" + e.toString());
    } on SocketException catch (e) {
      Navigator.pop(context);
      showSnakbar(context, exception_message);
      print("Socket Exception" + e.toString());
    } on Exception catch (e) {
      Navigator.pop(context);
      showSnakbar(context, exception_message);
      print("Exception" + e.toString());
    }
  }

  postLoginApi(BuildContext context, String myUrl, Map<String, dynamic>  dataBody) async {
    try {
      print("servicesApi>>");
      showAlertDialog(context);
      http.Response response = await http
          .post(myUrl,

          body: dataBody)
          .timeout(Duration(seconds: api_timeout));


      Navigator.pop(context);
      var jsonres = jsonDecode(response.body);

      print("servicesapi>>> " + jsonres.toString());

      if (response.statusCode == 200) {
        var jsonres = jsonDecode(response.body);
//        if (jsonres['status'] == "1") {
          Map<String, dynamic> map = jsonDecode(response.body);
          return map;
//        }
      } else if (response.statusCode == 400) {
        Navigator.pop(context);
      } else if (response.statusCode == 500) {Navigator.pop(context);
      } else if (response.statusCode == 301) {Navigator.pop(context);}else{
        Navigator.pop(context);
      }
    } on TimeoutException catch (e) {
      Navigator.pop(context);
      showSnakbar(context, exception_message);
      print("Timeout Exception" + e.toString());
    } on SocketException catch (e) {
      Navigator.pop(context);
      showSnakbar(context, exception_message);
      print("Socket Exception" + e.toString());
    } on Exception catch (e) {
      Navigator.pop(context);
      showSnakbar(context, exception_message);
      print("Exception" + e.toString());
    }
  }


  httpstreamupload(BuildContext context,File imageFile,String FirstNameEmp,
      String LastNameEmp,
      String EmailEmp,
      String ContactEmp,
      String EmpIdEmp,
      String DepID,
      String DesID,
      String ge,) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fileName = imageFile.path.split('/').last;
//    String VdoFileName = vdofile.path.split('/').last;
    var stream = new http.ByteStream((imageFile.openRead()));
//    var Vdostream= new http.B
    // get file length
    var length = await imageFile.length(); //imageFile is your image file
    print("<<length " + length.toString());
    Map<String, String> headers = {
      "Authorization":prefs.get("accesToken"),
    }; // ignore this headers if there is no authentication

    // string to uri
    var uri = Uri.parse(empStoreUrl);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFileSign = new http.MultipartFile('file[]', stream, length,
        filename : fileName);
//    var Vdomultipart = new http.MultipartFile('videos[]', stream, length,filename:VdoFileName );

    // add file to multipart
    request.files.add(multipartFileSign);
//    request.files.add(Vdomultipart);

    //add headers
    request.headers.addAll(headers);



  request.fields['first_name'] = FirstNameEmp;
  request.fields['last_name'] = LastNameEmp;
  request.fields['email'] = EmailEmp;
    request.fields['gender'] =ge;
    request.fields['department_id'] =DepID;
    request.fields['designation_id'] =DesID;
    request.fields['contact_no'] =ContactEmp;
    request.fields['employee_id'] =EmpIdEmp;


    showAlertDialog(context);

    var response = await request.send();

    print("streamupload> " + response.statusCode.toString());
Navigator.pop(context);
showToast(context, "Success");
    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print("streamupload> " + value);
    });
  }
Future<EmployeeStoreDataModel>  dioapi(BuildContext context,File _image,String FirstNameEmp,
      String LastNameEmp,
      String EmailEmp,
      String ContactEmp,
      String EmpIdEmp,
      String DepID,
      String DesID,
      String ge) async {

    String fileName = _image.path.split('/').last;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData formData = new FormData.fromMap({
      "first_name": FirstNameEmp,
      "last_name": LastNameEmp,
      "email": EmailEmp,
      "gender": ge,
      "department_id": DepID,
      "designation_id": DepID,
      "contact_no": ContactEmp,
      "employee_id": EmpIdEmp,
//      "file" :  MultipartFile.fromFile(_image.path,filename: fileName,contentType: MediaType('file','jpg') ),
      "type":"file/png"

    });
    print(fileName);
    print(_image.path);

   try{
     print("servicesApi>>");
     showAlertDialog(context);
     var dio=Dio();

     Response response = await dio.post(empStoreUrl,data: formData,options: Options(headers: {
       'accept':"*/*",
       'Content-Type': 'application/json',
       'Authorization': prefs.get("accesToken"),
     },responseType: ResponseType.json));
     Navigator.pop(context);
     if (response.statusCode == 200 || response.statusCode == 500) {
       print(response.statusCode);
       return EmployeeStoreDataModel.fromJson(json.decode(response.toString()));
     } else {
       throw Exception('Failed to upload!');
     }
   } catch(e){
     print(e);
   }


}

}

