import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/model/user.dart';
import 'package:flutter_base/routers/application.dart';
import 'package:flutter_base/routers/routers.dart';

class Drawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawerState();
  }
}

class _DrawerState extends State<Drawer> {
  final TextStyle textStyle =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300);

  void onTapError(BuildContext context) {
    Application.router.navigateTo(context, Routes.error404, transition: TransitionType.native);
  }

  void onTapSearch(BuildContext context) {
    Application.router.navigateTo(context, Routes.search, transition: TransitionType.native);
  }

  void onTapCollection(BuildContext context) {
    // push
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return Collection();
    // }));
    // pushNamed
    Navigator.pushNamed(context, '/collection',
        arguments: User(name: "zhoujain", email: "403887191@qq.com"));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658')),
              ),
              accountName: new Text('ZJ'),
              accountEmail: new Text('237549830@qq.com'),
            ),
            ListTile(
              leading: Icon(Icons.search, size: 27.0),
              title: new Text('全网搜', style: textStyle),
              onTap: () {
                onTapSearch(context);
              },
            ),
            new Divider(height: 1.0),
            ListTile(
              leading: Icon(Icons.favorite, size: 27.0),
              title: new Text('我的收藏', style: textStyle),
              onTap: () {
                onTapCollection(context);
              },
            ),
            new Divider(height: 1.0),
            ListTile(
              leading: Icon(Icons.email, size: 27.0),
              title: new Text('反馈/建议', style: textStyle),
              onTap: () {
                onTapError(context);
              },
            ),
            new Divider(height: 1.0),
            ListTile(
              leading: Icon(Icons.share, size: 27.0),
              title: new Text('分享', style: textStyle),
              onTap: () {
                print('分享');
              },
            ),
            new Divider(height: 1.0),
            ListTile(
              leading: Icon(Icons.exit_to_app, size: 27.0),
              title: new Text('退出登陆', style: textStyle),
              onTap: () {
                print('退出登陆');
              },
            )
          ],
        ),
      ),
    );
  }
}
