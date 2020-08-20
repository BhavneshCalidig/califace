import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({this.hintText,this.items, this.onChanged, this.value});

  final List<String> items;
  final Function onChanged;
  final String value;
  final String hintText;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 3,
          )),
      ),

    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),


        child: DropdownButtonFormField<String>(

          decoration: InputDecoration.collapsed(hintText: ''),
        isExpanded: true,
        hint: Text(hintText,style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 18),),
        value: value,

        validator: (arg) {
        if (arg==null)
        return 'Please select $hintText';
        else
        return null;
        },
        onChanged: ( Value) {
//
//    setState(() {
//    selectedAddressType = Value;
//    });
        },
        items: items
            .map((String user) {
        return DropdownMenuItem<
        String>(
        value: user,
        child: Row(
        children: <Widget>[
        //user.icon,
        SizedBox(
        width: 10,
        ),
        Text(
        user,
        style: TextStyle(
        color:Colors.black),
        ),
        ],
        ),
        );
        }).toList(),
        ),


    );


//      Container(
//      decoration: BoxDecoration(
//
//      ),
//      child: DropdownButtonHideUnderline(
//        child: DropdownButton(
//
//          hint: Text("Address Type"),
//          items: items.map((String item) {
//            return DropdownMenuItem<String>(
//              value: item,
//              child: Text(item),
//            );
//          }).toList(),
//          onChanged: onChanged,
//          value: value,
//        ),
//      ),
//    );
  }
}
