import 'package:flutter/material.dart';
import 'widgets/box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

InputBorder border;

bool _bigger = false;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Center(child: Image.asset('images/logo.png'))),
              AnimatedContainer(
                height: 100,
                duration: Duration(milliseconds: 300),
              ),
              AnimatedContainer(
                height: _bigger ? 0 : 200,
                width: 250,
                duration: Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: _bigger ? InputBorder.none : border,
                          hintText: 'Мобильный телефон или почта'),
                    ),
                    Container(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: _bigger ? InputBorder.none : border,
                          hintText: 'Пароль'),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                height: _bigger ? 270 : 0,
                duration: Duration(milliseconds: 300),
              )
            ],
          ),
          AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: _bigger ? 1000 : 0,
              child: Stack(children: [
                ParadoxBox(top: 140, right: -80, scale: 0.8, rotate: -22),
                ParadoxBox(top: -60, left: -56, scale: 0.76, rotate: -12),
                ParadoxBox(bottom: -100, right: -50, scale: 1.26, rotate: -20),
                ParadoxBox(bottom: 180, left: -80, scale: 0.68, rotate: 30),
              ])),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () => setState(() {
                _bigger = !_bigger;
              }),
            ),
          ),
        ],
      ),
    );
  }
}
