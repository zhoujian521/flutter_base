import 'package:flutter/material.dart';
import 'package:flutter_base/themes/index.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userNameController;
  TextEditingController _pwswordController;
  GlobalKey<FormState> _formKey;

  bool _isShowPassWord;
  String _username;
  String _password;

  @override
  void initState() {
    super.initState();
    _isShowPassWord = true;
    _userNameController = new TextEditingController();
    _pwswordController = new TextEditingController();
    _formKey = new GlobalKey();
    _username = '';
    _password = '';
  }

  void _login() {
    _formKey.currentState.save();
    print('~~~~$_username~~~$_password~~~~~');
  }

  void _showPassWord() {
    setState(() {
      _isShowPassWord = !_isShowPassWord;
    });
  }

  Widget _buildLogoWidget() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Image.asset('assets/images/gitHub.png',
            fit: BoxFit.contain, width: 60.0, height: 60.0),
        new Image.asset('assets/images/arrow.png',
            fit: BoxFit.contain, width: 40.0, height: 30.0),
        new Image.asset('assets/images/FlutterGo.png',
            fit: BoxFit.contain, width: 60.0, height: 60.0),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 100.0,
      child: new Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: TextFormField(
                controller: _userNameController,
                decoration: new InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: AppColours.text_dark,
                    ),
                    hintText: '请输入用户名'),
                validator: (value) {
                  if (value.isEmpty) return '用户名不可以为空！';
                  return null;
                },
                onEditingComplete: () {},
                onSaved: (value) {
                  setState(() {
                    _username = value;
                  });
                },
              ),
            ),
            new SizedBox(height: 20.0),
            new Flexible(
              child: TextFormField(
                controller: _pwswordController,
                decoration: new InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: AppColours.text_dark,
                  ),
                  hintText: '请输入密码',
                  suffixIcon: IconButton(
                    icon: new Icon(Icons.remove_red_eye),
                    color: AppColours.text_dark,
                    onPressed: _showPassWord,
                  ),
                ),
                obscureText: _isShowPassWord,
                validator: (value) {
                  if (value.isEmpty) return '密码不可以为空！';
                  return null;
                },
                onEditingComplete: () {},
                onSaved: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    TextStyle style =
        TextStyle(fontSize: Dimens.font_sp16, color: Colors.white);
    return new Center(
      child: new GestureDetector(
        child: new Container(
          decoration: new BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            color: Theme.of(context).primaryColor,
          ),
          padding: const EdgeInsets.only(
              left: 40.0, right: 40.0, top: 10.0, bottom: 10.0),
          child: new Text(
            '登录',
            style: style,
          ),
        ),
        onTap: () {
          if (!_formKey.currentState.validate()) return;
          _login();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: new Center(
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            height: 320.0,
            child: new Column(
              children: <Widget>[
                new SizedBox(height: 35.0),
                _buildLogoWidget(),
                new SizedBox(height: 25.0),
                _buildLoginForm(context),
                new SizedBox(height: 25.0),
                _buildLoginBtn(),
                new SizedBox(height: 25.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
