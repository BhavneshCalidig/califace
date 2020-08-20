
import 'package:califace/Login_Screen.dart';
import 'package:califace/califacescreen/HomeScreen.dart';
import 'package:califace/thems/ThemeScreen.dart';
import 'package:califace/thems/theme_notifier.dart';
import 'package:califace/thems/theme_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(blueTheme), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Dynamic Theme",
      theme: themeNotifier.getTheme(),
      home: HomeScreen(),
    );
  }
}