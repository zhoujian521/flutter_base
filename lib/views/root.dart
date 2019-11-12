import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final data = [
    {'title': '首页', 'icon': Icon(Icons.language)},
    {'title': '客户', 'icon': Icon(Icons.extension)},
    {'title': '资讯', 'icon': Icon(Icons.import_contacts)},
    {'title': '我的', 'icon': Icon(Icons.account_circle)}
  ];
  List<BottomNavigationBarItem> _items = [];

  @override
  void initState() {
    super.initState();
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
      appBar: new AppBar(
        title: new Text('Home'),
      ),
      body: new Center(
        child: new Text('Home'),
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
