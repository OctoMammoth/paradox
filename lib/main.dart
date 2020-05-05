import 'package:flutter/material.dart';
import 'dart:async';
import 'widgets/box.dart';
import 'home.dart';
import 'login.dart';
import 'payments.dart';
import 'search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Color(0xFF0B131F)
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/payments': (context) => Payments(),
        '/search' : (context) => Search()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

InputBorder border;

bool _bigger = true;

class _MyHomePageState extends State<MyHomePage> {
  Timer _timer;

  _MyHomePageState() {
    _timer = new Timer(const Duration(seconds: 3), () async {
      setState(() {
        _bigger = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: _bigger ? 0 : 300,
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
                    Container(
                      height: 60,
                    ),
                    FlatButton(
                        color: Color(0xFF3367EF),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Войти',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),)
                    ),
                    FlatButton(
                        color: null,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: null,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Войти как сотрудник',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,color: Color(0xFF3367EF),),
                          ),)
                    )
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
              duration: Duration(milliseconds: 500),
              width: _bigger ? 1000 : 0,
              child: Stack(children: [
                ParadoxBox(top: 140, right: -80, scale: 0.8, rotate: -22),
                ParadoxBox(top: -60, left: -56, scale: 0.76, rotate: -12),
                ParadoxBox(bottom: -100, right: -50, scale: 1.26, rotate: -20),
                ParadoxBox(bottom: 180, left: -80, scale: 0.68, rotate: 30),
              ])),
//          Positioned(
//            right: 20,
//            bottom: 20,
//            child: FloatingActionButton(
//              onPressed: () => setState(() {
//                _bigger = !_bigger;
//              }),
//            ),
//          ),
        ],
      ),
    );
  }
}
