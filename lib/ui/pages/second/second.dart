import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class Second extends StatefulWidget {
  final String name;
  final String email;

  const Second({Key key, this.name, this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SecondState();
  }
}

class _SecondState extends State<Second> {
  int _count = 20;
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: Container(child: null),
        title: new Text('第二个页面'),
      ),
      body: EasyRefresh.custom(
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        controller: _controller,
        header: PhoenixHeader(),
        footer: MaterialFooter(
          backgroundColor: Colors.cyan,
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print('onRefresh');
            setState(() {
              _count = 20;
            });
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print('onLoad');
            setState(() {
              _count += 10;
            });
            _controller.finishLoad(noMore: _count >= 40);
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => Container(
                height: 60.0,
                color: index % 2 == 0 ? Colors.white : Colors.grey[100],
                child: new Center(
                  child: new Text('$index'),
                ),
              ),
              childCount: _count,
            ),
          ),
        ],
      ),
    );
  }
}
