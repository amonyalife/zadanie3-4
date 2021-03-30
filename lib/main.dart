import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MaterialApp",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> bartab = [
    {'title': 'профиль', 'icon': Icon(Icons.account_circle)},
    {'title': 'message', 'icon': Icon(Icons.message)},
    {'title': 'избранные', 'icon': Icon(Icons.favorite)},
    {'title': 'настройки', 'icon': Icon(Icons.settings)},
  ];

  var _tabController;
  int _ab = 0;
  bool _isPain = false;
  bool elevated1 = false;
  bool elevated2 = false;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: bartab.length, vsync: this, initialIndex: 0);
    _tabController.addListener(_tabListener);
  }

  _tabListener() {
    setState(() {
      _ab = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MaterialApp"),
        backgroundColor: Colors.blue,
        centerTitle: true,
       actions: [
            Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.filter),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),),],),
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 350.0),
              child: Column(children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.red,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/400'),
                ),
                Text('имя пользователя'),
              ]),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.red,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200/400'),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                trailing: Icon(Icons.arrow_forward)),
            ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('attach_money'),
                trailing: Icon(Icons.arrow_forward)),
            Container(
              margin: EdgeInsets.only(top: 400.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        elevated1 = true;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Выход'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          elevated2 = true;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text('Регистрация')),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.yellow,
            height: 400.0,
            child: Center(
              child: _isPain ? Text('заказ оплачен') : null,
            ),
          ),
          Container(
            color: Colors.grey,
            height: 400.0,
          ),
          Container(
            height: 400.0,
            child: Center(child: elevated1 ? Text('вы вышли') : null),
            color: Colors.orange,
          ),
          Container(
            height: 400.0,
            child:
                Center(child: elevated2 ? Text('страница регистрации') : null),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        onTap: (int index) {
          print(index);
          setState(() {
            _tabController.index = index;
            _ab = index;
          });
        },
        currentIndex: _ab,
        items: bartab
            .map(
              (item) => BottomNavigationBarItem(
                  icon: item['icon'], label: item['title']),
            )
            .toList(),
        backgroundColor: Colors.greenAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200.0,
                  color: Colors.green,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.payment),
                        title: Text('сумма '),
                        trailing: Text('200 рублей'),
                        tileColor: Colors.red,
                      ),
                      ElevatedButton(
                        child: Text('оплатить'),
                        onPressed: () {
                          setState(() {
                            _isPain = true;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              });
        },
        child: Text('+'),
      ),
    );
  }
}
