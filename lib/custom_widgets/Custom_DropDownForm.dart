import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
class Custom_DropDownForm extends StatelessWidget{
  Custom_DropDownForm({this.text,this.onSaved,this.value,this.onChanged,this.items});
  final List<String> items;
  final Function onChanged;
  final String value;
  final Function onSaved;
  final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 300,
      //height: MediaQuery.of(context).size.height,
      child: DropdownButtonFormField(hint: Text(text,style: (TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 18
      )),),onSaved:onSaved ,items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item,style: TextStyle(
              fontSize: 18),),
        );
      }).toList(), onChanged: onChanged),
    );
  }
}