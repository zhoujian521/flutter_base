import 'package:flutter/material.dart';
import 'package:flutter_base/themes/metrics.dart';

class SearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchBarState();
  }
}

final TextEditingController controller = TextEditingController();

class _SearchBarState extends State<SearchBar> {
  void onSearchTextChanged(String text) {
    print('~~~~~~~~~$text~~~~~~~~~~~');
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 6.0),
      child: new Card(
        child: new Row(
          children: <Widget>[
            new Icon(Icons.search, color: Colors.grey, size: IconSize.small),
            new Expanded(
              child: Container(
                child: TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0.0),
                    hintText: '全网搜索 Flutter 相关知识库',
                    hintStyle: new TextStyle(fontSize: 12.0),
                    border: InputBorder.none,
                  ),
                  onChanged: onSearchTextChanged,
                ),
              ),
            ),
            new IconButton(
              icon: Icon(Icons.cancel),
              color: Colors.grey,
              iconSize: IconSize.small,
              onPressed: () {
                print('xxxxxxxxx');
                controller.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
