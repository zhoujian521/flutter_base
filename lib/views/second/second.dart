import 'package:flutter/material.dart';
import 'package:flutter_base/model/article.dart';
import 'package:flutter_base/views/second/content.dart';

class Second extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondState();
  }
}

class _SecondState extends State<Second> {
  final List<Article> articles = new List.generate(
    10,
    (i) => new Article(
      title: 'Article $i',
      content: 'Article $i: The quick brown fox jumps over the lazy dog.',
    ),
  );

  void onTapItem(BuildContext context, int index) async {
    String res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => new ContentScreen(
          article: articles[index],
        ),
      ),
    );
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('第二个页面'),
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: articles.length,
          itemBuilder: (BuildContext context, int index) {
            var item = articles[index];
            return ListTile(
              title: new Text(item.title),
              subtitle: new Text(item.content),
              onTap: () {
                onTapItem(context, index);
              },
            );
          },
        ),
      ),
    );
  }
}
