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
       'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNzU0MWUyN2M4NmJmZjY5MDIxOWZhZTMzMmJkMTc2ZjJkYWEyMDhjZmMwZjRjMDc1NjY1NGYxNDBmODFkMDNiZWJiZDM1NTYzZDNmMGNhNzUiLCJpYXQiOjE1OTc5MjM5OTcsIm5iZiI6MTU5NzkyMzk5NywiZXhwIjoxNjI5NDU5OTk3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.VMzN6z3a-sFmuPRbaJm48ZBZpS2iSPc3Mny72BQsJ4d3rGTwIXuyBVJrNzuZfAZdi7dxljruRODqg3u_472hgH7LJTH0N-HgzN4ofNMqawKcjl51PhJPUtUNUGiFEwXGVapDmJ2hAqUMjY-ZW82E8iFthAcYpaxRNDq--fM5T1dAVw5VdjecUW7srK0kZDttzw21nea983vQ_bf25FXtBwLcAqoxj4XkKkhaPwxjWUuNqlpDpB_me4W0ZOZsWF1xIG_u_yH1kI3d7L220EziH5_KqUo2ZZBYWowbFouUM-tTb2SM-I0ifRO3E37iWRi9i0bsuT5zyNVxfw-gZyoYwt3Ujc2ESFmCG6BhfRv-B2xj_XOVKvTFEgZA25cDnuJe_470Ra_LXIGLiv1iSFeCXYlsj6pcRkl-qtb48G5fM-iw4hbkBaXRQUGTs3rU90Gi_lZMX3_RgsXrERqFJdkVmnGo19F2xfECXQa108PcnS-8Nb3jAaVgBBeNy272xH6oui90PuKtbDwuvZ2DRGJQ4JjtM_Px8pjFKfSqT_EekrgG6L4k5XF6ubRBryFi9VQMi8HaVgsLEq6sLwigt_zDJnMf4RBGFvKLrQ6rFaAacYpMotNWl88EtCb9mC3nCIqpdwrHfLWfYSX5um-6C-f_oitz0Oo3dNqBTOPopalHGCE',
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
getApi(BuildContext context, String myUrl)async{

    try{
      print("servicesApi>>");

      http.Response response = await http.get(myUrl,headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNzU0MWUyN2M4NmJmZjY5MDIxOWZhZTMzMmJkMTc2ZjJkYWEyMDhjZmMwZjRjMDc1NjY1NGYxNDBmODFkMDNiZWJiZDM1NTYzZDNmMGNhNzUiLCJpYXQiOjE1OTc5MjM5OTcsIm5iZiI6MTU5NzkyMzk5NywiZXhwIjoxNjI5NDU5OTk3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.VMzN6z3a-sFmuPRbaJm48ZBZpS2iSPc3Mny72BQsJ4d3rGTwIXuyBVJrNzuZfAZdi7dxljruRODqg3u_472hgH7LJTH0N-HgzN4ofNMqawKcjl51PhJPUtUNUGiFEwXGVapDmJ2hAqUMjY-ZW82E8iFthAcYpaxRNDq--fM5T1dAVw5VdjecUW7srK0kZDttzw21nea983vQ_bf25FXtBwLcAqoxj4XkKkhaPwxjWUuNqlpDpB_me4W0ZOZsWF1xIG_u_yH1kI3d7L220EziH5_KqUo2ZZBYWowbFouUM-tTb2SM-I0ifRO3E37iWRi9i0bsuT5zyNVxfw-gZyoYwt3Ujc2ESFmCG6BhfRv-B2xj_XOVKvTFEgZA25cDnuJe_470Ra_LXIGLiv1iSFeCXYlsj6pcRkl-qtb48G5fM-iw4hbkBaXRQUGTs3rU90Gi_lZMX3_RgsXrERqFJdkVmnGo19F2xfECXQa108PcnS-8Nb3jAaVgBBeNy272xH6oui90PuKtbDwuvZ2DRGJQ4JjtM_Px8pjFKfSqT_EekrgG6L4k5XF6ubRBryFi9VQMi8HaVgsLEq6sLwigt_zDJnMf4RBGFvKLrQ6rFaAacYpMotNWl88EtCb9mC3nCIqpdwrHfLWfYSX5um-6C-f_oitz0Oo3dNqBTOPopalHGCE',
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
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNzU0MWUyN2M4NmJmZjY5MDIxOWZhZTMzMmJkMTc2ZjJkYWEyMDhjZmMwZjRjMDc1NjY1NGYxNDBmODFkMDNiZWJiZDM1NTYzZDNmMGNhNzUiLCJpYXQiOjE1OTc5MjM5OTcsIm5iZiI6MTU5NzkyMzk5NywiZXhwIjoxNjI5NDU5OTk3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.VMzN6z3a-sFmuPRbaJm48ZBZpS2iSPc3Mny72BQsJ4d3rGTwIXuyBVJrNzuZfAZdi7dxljruRODqg3u_472hgH7LJTH0N-HgzN4ofNMqawKcjl51PhJPUtUNUGiFEwXGVapDmJ2hAqUMjY-ZW82E8iFthAcYpaxRNDq--fM5T1dAVw5VdjecUW7srK0kZDttzw21nea983vQ_bf25FXtBwLcAqoxj4XkKkhaPwxjWUuNqlpDpB_me4W0ZOZsWF1xIG_u_yH1kI3d7L220EziH5_KqUo2ZZBYWowbFouUM-tTb2SM-I0ifRO3E37iWRi9i0bsuT5zyNVxfw-gZyoYwt3Ujc2ESFmCG6BhfRv-B2xj_XOVKvTFEgZA25cDnuJe_470Ra_LXIGLiv1iSFeCXYlsj6pcRkl-qtb48G5fM-iw4hbkBaXRQUGTs3rU90Gi_lZMX3_RgsXrERqFJdkVmnGo19F2xfECXQa108PcnS-8Nb3jAaVgBBeNy272xH6oui90PuKtbDwuvZ2DRGJQ4JjtM_Px8pjFKfSqT_EekrgG6L4k5XF6ubRBryFi9VQMi8HaVgsLEq6sLwigt_zDJnMf4RBGFvKLrQ6rFaAacYpMotNWl88EtCb9mC3nCIqpdwrHfLWfYSX5um-6C-f_oitz0Oo3dNqBTOPopalHGCE',
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

