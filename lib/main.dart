

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
      appBar: AppBar(
        title: Text('aaa'),
      ),
      body: Column(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      labelText: 'text',
                      labelStyle: TextStyle(color: Colors.purple),
                      hintText: 'введите  текст',
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.purple,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200]),
                ),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                 child:Text('поле для подсказки' ),),
          ],
        ),
       
       
        Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double _width = constraints.constrainWidth();

              return _width > 500
                    ?   
                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: data.length,
                      scrollDirection: Axis.vertical,
                      
                      itemBuilder: (BuildContext context, int index) =>
                          data[index],
                         
                          
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          data[index],
                          
                    );
            },
          ),
        ),
      ]),
    );
  }
}
