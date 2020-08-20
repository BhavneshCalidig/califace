import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Submit_Button extends StatelessWidget{
  Custom_Submit_Button({this.text,this.onPressed,this.color,this.height,this.width});
  final String text;
  final Function onPressed;
  final Color color;
  final double height;
  final double width;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: height,
      width: width,
      child: RaisedButton(onPressed: onPressed,
        child: Text(text,style: (TextStyle(
          color: Theme.of(context).indicatorColor
        )),),color:color ,),
    );
  }
}