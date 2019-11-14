import 'package:flutter/material.dart';

class Empty extends StatefulWidget {
  final String content;
  const Empty({Key key, this.content}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EmptyState();
  }
}

class _EmptyState extends State<Empty> {
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          // color: Colors.cyan,
          ),
      child: Column(
        children: <Widget>[
          new Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.2)),
          new Image.asset(
            'assets/images/nothing.png',
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          new Text(widget.content)
        ],
      ),
    );
  }
}
