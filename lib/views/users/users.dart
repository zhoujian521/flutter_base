import 'package:flutter/material.dart';
import 'package:flutter_base/views/drawer/drawer.dart' as ZJDrawer;

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineState();
  }
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: ZJDrawer.Drawer(),
      ),
    );
  }
}