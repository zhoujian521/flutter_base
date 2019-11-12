import 'package:flutter/material.dart';

import 'package:flutter_base/views/home/home.dart';
import 'package:flutter_base/views/second/second.dart';
import 'package:flutter_base/views/third/third.dart';
import 'package:flutter_base/views/users/users.dart';

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootState();
  }
}

class _RootState extends State<Root> {
  int _currentIndex = 0;
  final data = [
    {'title': '首页', 'icon': Icon(Icons.language)},
    {'title': '客户', 'icon': Icon(Icons.extension)},
    {'title': '资讯', 'icon': Icon(Icons.import_contacts)},
    {'title': '我的', 'icon': Icon(Icons.account_circle)}
  ];
  List<BottomNavigationBarItem> _items = [];
  List<Widget> _list = List();

  @override
  void initState() {
    super.initState();
    _list..add(Home())..add(Second())..add(Third())..add(Mine());

    print(_list);
    print(<Widget>[Home(), Second(), Third(), Mine()]);
    for (var item in data) {
      _items.add(
        BottomNavigationBarItem(
          title: Text(item['title']),
          icon: item['icon'],
          activeIcon: item['icon'],
        ),
      );
    }
  }

  void _onTap(int index) {
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: IndexedStack(
          index: _currentIndex,
          children: _list,
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
