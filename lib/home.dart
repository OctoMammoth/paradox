import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}
InputBorder border;
class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [

          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () => setState(() {
                Navigator.pushReplacementNamed(context, '/');
              }),
            ),
          ),
        ],)
    );
  }
}