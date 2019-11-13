import 'package:flutter/material.dart';

class Drawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawerState();
  }
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('侧边抽屉'),
      ),
      body: new Center(
        child: new Text('侧边抽屉'),
      ),
    );
  }
}
