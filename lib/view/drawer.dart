import 'package:flutter/material.dart';

Widget customDrawer(BuildContext context) {
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: InkWell(
            child: Text(
              'Hardware Menu',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () => Navigator.pop(context)),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Item 1'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('Item 2'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ],
  ));
}
