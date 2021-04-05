import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "zadanie2",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<Widget> data = List.generate(100, (index) {
    return Card(
      color: Colors.green,
      elevation: 2.0,
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('$index'),
        )
      ]),
    );
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                  Image.network('https://picsum.photos/seed/picsum/200/300',
                      fit: BoxFit.cover),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ]),
                title: Text('Sliver'),
                centerTitle: true,
              ),
              expandedHeight: 200),
          SliverList(
            delegate: SliverChildListDelegate(
              data.map((e) => e).toList(),
            ),
          ),
        ],
      ),
      // body: Stack(
      //   children:<Widget>[
      //     Image.network("https://static3.depositphotos.com/1001122/125/i/950/depositphotos_1257997-stock-photo-mountain-stream.jpg"),
      //     Text('zadanie2')

      //   ]
      // ),
    );
  }
}
