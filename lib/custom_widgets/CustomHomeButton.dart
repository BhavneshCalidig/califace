import 'package:flutter/material.dart';

class CustomHomeButton extends StatelessWidget {

  CustomHomeButton({this.text,this.iconData,this.size,this.onpressed});
  final String text;
  final IconData iconData;
  final Function onpressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
         // shape: BoxShape.circle,
          color: Theme.of(context).accentColor.withOpacity(.9),
//          boxShadow: [
//            BoxShadow(
//              color: Colors.grey.withOpacity(0.2),
//              blurRadius: 2,
//              spreadRadius: 1,
//              offset: Offset(5, 10),
//            ),
//            BoxShadow(
//                color: Colors.white,
//                blurRadius: 5,
//                spreadRadius: -2,
//                offset: Offset(-3, -4))
//          ],
        ),
        height: size,
        width: size,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(iconData,color: Theme.of(context).indicatorColor,),
            SizedBox(height: 10),
            Text(text,style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 20),),
          ],
        ),

      ),
    );
  }
}
