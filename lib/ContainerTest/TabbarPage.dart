import 'package:flutter/material.dart';
import 'package:ios_develop/SecondScreen.dart';
import 'package:ios_develop/ContainerTest/ContainerPage.dart';
import 'package:english_words/english_words.dart';

class TabbarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '标签/导航组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabbarHomePage(title: '标签/导航组件'),
    );
  }
}

class TabbarHomePage extends StatefulWidget {
  TabbarHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TabbarPageState createState() => new _TabbarPageState();
}

class _TabbarPageState extends State<TabbarHomePage>
    with SingleTickerProviderStateMixin {
  //默认标签页
  int _selectedIndex = 0;

  TabController _tabController; //需要定义一个Controller
  List tabs = ["动画demo", "容器类组件", "上拉加载demo"];

  @override
  void initState() {
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
        centerTitle: false,
        bottom: TabBar(
            //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),

      ///抽屉式菜单栏
      drawer: new MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          if (e == '动画demo') {
            return Container(
              alignment: Alignment.center,
              child: SecondScreenPage(),
            );
          } else if (e == '容器类组件') {
            return Container(
              alignment: Alignment.center,
              child: ContainerHomePage(),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: InfiniteListView(),
            );
          }
        }).toList(),
      ),
    );
  }
}

///对抽屉式菜单栏进行自定义
class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        'Assets/logoImage/logo.png',
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "啧啧",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
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

///通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，这是因为SingleChildScrollView不支持基于Sliver的延迟实例化模型，所以如果预计视口可能包含超出屏幕尺寸太多的内容时，那么使用SingleChildScrollView将会非常昂贵（性能差），此时应该使用一些支持Sliver延迟加载的可滚动组件，如ListView。
class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      // 显示进度条
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: str
                .split("")
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(
                      c,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

///利用listView模拟上拉加载操作
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true; //保存状态
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        controller: _controller,
        itemCount: _words.length,
        itemBuilder: (context, index) {
          //如果到了表尾
          if (_words[index] == loadingTag) {
            //不足100条，继续获取数据
            if (_words.length - 1 < 100) {
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ));
            }
          }
          //显示单词列表项
          return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (context, index) => Divider(height: .0),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              }),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成10个单词

          generateWordPairs().take(10).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}
