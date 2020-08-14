import 'package:califace/thems/ThemeScreen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Drawer(

      child: ListView(
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
            title: Text("Dashboard",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            title: Text("My Profile",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ExpansionTile(
            title: Text("Edit Profile",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20)),
            children: <Widget>[
              ListTile(
                title: Text("Personal Information",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18),),
                trailing: Icon(Icons.arrow_forward),
              ),
              SizedBox(height: 5,),
              ListTile(
                title: Text("Professional Information",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18),),
                trailing: Icon(Icons.arrow_forward),
              ),


            ],
          ),
          Divider(),
          ListTile(
            title: Text("Settings",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),),
            trailing: Icon(Icons.arrow_forward),
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ThemeScreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Help and Support",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            title: Text("Logout",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),),
            trailing: Icon(Icons.arrow_forward),
          ),


        ],
      ),

    );
  }
}
