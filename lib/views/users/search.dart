import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: new Text('全网搜'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text("Search.dart"),
        ),
      ),
    );
  }
}