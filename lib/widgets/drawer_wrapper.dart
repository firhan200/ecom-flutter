import 'package:flutter/material.dart';
import 'package:gojek/screens/drawer_page.dart';

class DrawerWrapper extends StatefulWidget {
  final Widget content;

  DrawerWrapper({this.content});

  @override
  _DrawerWrapperState createState() => _DrawerWrapperState();
}

class _DrawerWrapperState extends State<DrawerWrapper> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [DrawerPage(), widget.content],
    );
  }
}
