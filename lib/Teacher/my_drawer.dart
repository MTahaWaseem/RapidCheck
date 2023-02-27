import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Navigate to the corresponding page
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Navigate to the corresponding page
            },
          ),
        ],
      ),
    );
  }
}