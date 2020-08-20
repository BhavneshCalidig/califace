import 'package:califace/thems/ThemeScreen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Drawer(

        child: Scaffold(
          backgroundColor:  Theme.of(context).primaryColor,
          body: ListView(

            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/iottechsoftware.png"),
                        fit: BoxFit.contain
                    )
                ),
                child: Text("Hi Everyone"),
              ),
              ListTile(
                title: Text("Dashboard",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward),
              ),
              Divider(),
             ExpansionTile(title: Text("Employee",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),),children: <Widget>[
               ListTile(
                 title: Text("Add Employee",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
               ),
               ListTile(
                 title: Text("All Employee",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
               )
             ],),
              Divider(),
              ExpansionTile(title: Text("Designation",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  title: Text("Add Designation",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
                ),
                ListTile(
                  title: Text("All Designation",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
                )
              ],),
              Divider(),
              ExpansionTile(title: Text("Department",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  title: Text("Add Department",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
                ),
                ListTile(
                  title: Text("All Department",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
                )
              ],),

              Divider(),
              ExpansionTile(title: Text("Cameras",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  title: Text("Add Camera",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
                ),
                ListTile(
                  title: Text("All Cameras",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
                )
              ],),
              Divider(),
              ExpansionTile(title: Text("Attandance",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  title: Text("Add Attandace",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
                ),
                ListTile(
                  title: Text("All Attandance",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
                )
              ],),
              Divider(),
              ExpansionTile(title: Text("Visitors",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),),children: <Widget>[
                ListTile(
                  title: Text("Today Visitors",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
                ),
                ListTile(
                  title: Text("All Visitors",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20)),
                )
              ],),
              Divider(),
              ListTile(
                title: Text("Settings",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ThemeScreen()));
                },
              ),


            ],
          ),
        ),

    );

  }
}
