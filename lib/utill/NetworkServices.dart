import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'constnts.dart';
import 'myfunction.dart';

class NetworkServices {


  postApi(BuildContext context, String myUrl, Map<String, dynamic>  dataBody) async {
    try {
      print("servicesApi>>");
      showAlertDialog(context);
      http.Response response = await http
          .post(myUrl,
              headers: {
                'Content-Type': 'application/json',
       'Authorization': 'Bearer ',
              },
              body: jsonEncode(dataBody))
          .timeout(Duration(seconds: api_timeout));


      Navigator.pop(context);
      var jsonres = jsonDecode(response.body);

      print("servicesapi>>> " + jsonres.toString());

      if (response.statusCode == 200) {
        var jsonres = jsonDecode(response.body);
        if (jsonres['status'] == "1") {
          Map<String, dynamic> map = jsonDecode(response.body);
          return map;
        }
      } else if (response.statusCode == 400) {
      } else if (response.statusCode == 500) {
      } else if (response.statusCode == 301) {}
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
}
