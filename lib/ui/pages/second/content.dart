import 'package:flutter/material.dart';
import 'package:flutter_base/data/model/article.dart';

class ContentScreen extends StatelessWidget {
  final Article article;

  ContentScreen({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${article.title}'),
      ),
      body: new Padding(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              new Text('${article.content}'),
              new RaisedButton(
                child: new Text('收藏'),
                onPressed: () {
                  Navigator.pop(context, 'Like');
                },
              ),
              new RaisedButton(
                child: new Text('取消收藏'),
                onPressed: () {
                  Navigator.pop(context, 'Unlike');
                },
              ),
            ],
          )),
    );
  }
}
