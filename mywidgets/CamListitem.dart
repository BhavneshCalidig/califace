import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CamListItem extends StatefulWidget {
  @override
  _CamListItemState createState() => _CamListItemState();
}

class _CamListItemState extends State<CamListItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),


        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Text('B'),
            foregroundColor: Colors.white,
          ),
          title: Text('Name'),
          subtitle: Text('one imp item'),
        ),
      ),
//      actions:
//      <Widget>[
//        IconSlideAction(
//          caption: 'Archive',
//          color: Colors.blue,
//          icon: Icons.archive,
//          onTap: () => print('Archive'),
//        ),
//        IconSlideAction(
//          caption: 'Share',
//          color: Colors.indigo,
//          icon: Icons.share,
//          onTap: () => print('Share'),
//        ),
//      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => print('Edit'),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => print('Delete'),
        ),
      ],
    );
  }
}
