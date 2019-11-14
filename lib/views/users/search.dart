import 'package:flutter/material.dart';
import 'package:flutter_base/themes/metrics.dart';
import 'package:flutter_base/components/search_bar.dart';

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
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, navBarHeight),
        child: AppBar(
          title: SearchBar(),
        ),
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
