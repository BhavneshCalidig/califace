import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;


saveStringSF(String key, String value) async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  sharedPrefs.setString(key, value);
//    sharedPrefs.setStringList(key, value);
}

saveBoolSF(String key, dynamic value) async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  sharedPrefs.setBool(key, value);
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        ),
        Container(
            margin: EdgeInsets.only(left: 10), child: Text("Please wait...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );



}
DateTime currentBackPressTime;

Future<bool> onDoubleClickExit(BuildContext context) {
  DateTime now = DateTime.now();

  if (currentBackPressTime == null || now.difference(currentBackPressTime) > Duration(seconds: 2)) {
    currentBackPressTime = now;
    showSnakbar(context, "back");
    return Future.value(false);
  }
  return Future.value(true);
}

Future<bool> onBackPressed(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit an App'),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true);
              SystemNavigator.pop();
            },
          )
        ],
      );
    },
  ) ?? false;
}

Future<bool> exitApp(BuildContext context) {
  return showDialog(
    context: context,
    child: AlertDialog(
      title: Text('Do you want to exit this application?'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            print("you choose no");
            Navigator.of(context).pop(false);
          },
          child: Text('No',style: TextStyle(color: Theme.of(context).primaryColor),),
        ),
        FlatButton(
          onPressed: () async {
            //  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            // await AuthClient.internal().signOut();

            await saveStringSF("token", "");
            await saveBoolSF('login', false);
//
//            Navigator.of(context).pushAndRemoveUntil(
//                MaterialPageRoute(builder: (c) => LoginScreen()),
//                    (r) => false);
          },
          child: Text('Yes',style: TextStyle(color: Colors.red),),
        ),
      ],
    ),
  ) ??
      false;
}

showSnakbarWithGlobalKey(GlobalKey<ScaffoldState> globalKey,String msg)
{
  try{
    final snackBar = SnackBar(content: Text(msg));
    globalKey.currentState.showSnackBar(snackBar);
  }catch(e)
  {

  }



}

showSnakbar(BuildContext context,String message) {
  try {




    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.green,
    ));
  } on Exception catch (e, s) {
    print(s);
  }
}

getTimeStamp()
{
  String timestamp = DateTime.now().toUtc().millisecondsSinceEpoch.toString().substring(0,9);
  return timestamp;
}

getPlateform()
{

  if (Platform.isAndroid) {
    return "Android";
  }
  else if (Platform.isIOS) {
    return "IOS";
  }
  else if (Platform.isFuchsia) {
    return "Fuchsia";
  }
  else if (Platform.isLinux) {
    return "Linux";
  }
  else if (Platform.isMacOS) {
    return "MacOS";
  }
  else if (Platform.isWindows) {
    return "Windows";
  }

}

