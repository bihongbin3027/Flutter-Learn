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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  //此部件是您的应用程序的主页。 它是有状态的，意思是
  //它具有一个State对象（定义如下），其中包含影响
  //它的外观。

  //此类是状态的配置。 它保存值（在此
  //父标题（在本例中为App小部件）提供的标题）
  //由State的build方法使用。 Widget子类中的字段是
  //始终标记为“最终”。

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      //对setState的调用告诉Flutter框架
      //在此状态下更改，这将导致它重新运行下面的build方法
      //，以便显示可以反映更新的值。 如果我们改变了
      // _counter而不调用setState（），则build方法将不会
      //再次调用，因此什么也不会发生。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //每次调用setState时都会重新运行此方法，例如完成
    //通过上面的_incrementCounter方法。
    // Flutter框架已经过优化，可以重新运行构建方法
    //快速，因此您可以重建任何需要更新的内容
    //而不是必须单独更改小部件的实例。
    return Scaffold(
      appBar: AppBar(
        //在这里，我们从MyHomePage对象创建的值中
        // App.build方法，并使用它来设置我们的应用栏标题。
        title: Text(widget.title),
      ),
      body: Center(
        // Center是一个布局小部件。 它需要一个孩子并放置它
        //在父级中间。
        child: Column(
          //列也是布局小部件。 它需要一个孩子的清单和
          //将它们垂直排列。 默认情况下，它会自动调整大小以适合其
          //水平放置子项，并尝试使其高度与父项相同。
          //
          //调用“调试绘画”（在控制台中按“ p”，选择
          // Android中的Flutter Inspector中的“切换调试画图”操作
          // Studio，或Visual Studio Code中的“切换调试画图”命令）
          //以查看每个小部件的线框。
          //
          //列具有各种属性来控制其自身的大小以及
          //它如何定位其子级。 这里我们使用mainAxisAlignment
          //将孩子垂直居中； 主轴在这里是垂直
          //轴，因为列是垂直的（交叉轴为
          //水平）。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // 该逗号结尾使自动格式化更适合构建方法。
    );
  }
}
