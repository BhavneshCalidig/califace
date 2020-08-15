import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({this.items, this.onChanged, this.value});

  final List<String> items;
  final Function onChanged;
  final String value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButton(
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      value: value,
    );
  }
}
