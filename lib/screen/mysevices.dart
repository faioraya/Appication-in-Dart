import 'package:flutter/material.dart';

class Mysevices extends StatefulWidget {
  @override
  _MysevicesState createState() => _MysevicesState();
}

class _MysevicesState extends State<Mysevices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Sevices'),
      ),
      body: Text('Body'),
    );
  }
}
