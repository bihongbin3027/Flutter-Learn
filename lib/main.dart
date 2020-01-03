import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 此部件是应用程序的根
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //这是您的应用程序的主题。
        //
        //尝试使用“ flutter run”运行您的应用程序。 您会看到
        //应用程序有一个蓝色的工具栏。 然后，不退出应用程序，尝试
        //将下面的primarySwatch更改为Colors.green，然后调用
        //“热重载”（在运行“ flutter run”的控制台中按“ r”，
        //或只是将更改保存到Flutter IDE中的“热重载”中。
        //请注意，计数器并未重置为零； 应用程序
        //不会重新启动。
        primarySwatch: Colors.blue,
      ),
      // 注册路由表
      routes: {
        // '/new_page': (context) {
        //   return NewRoute(text: ModalRoute.of(context).settings.arguments);
        // },
      },
      home: FormTestRoute()
    );
  }
}

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆'),
      ),
      body: Form(
        key: _formKey, // 设置globalKey，用于后面获取FormState
        autovalidate: true, // 开启自动效验
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名或邮箱',
                icon: Icon(Icons.person),
              ),
              // 效验用户名
              validator: (v) {
                return v.trim().length > 0 ? null : '用户名不能为空';
              },
            ),
            TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '您的登陆密码',
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              // 效验密码
              validator: (v) {
                return v.trim().length > 5 ? null : '密码不能少于6位';
              },
            ),
            // 登陆按钮
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Builder(builder: (context) {
                      return RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text('登陆'),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          //在这里不能通过此方式获取FormState，context不对
                          //print(Form.of(context));

                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据
                          if((Form.of(context)).validate()){
                            // 验证通过提交数据
                          }
                        }
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

