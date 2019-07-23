import 'package:flutter/material.dart';

class Mysevices extends StatefulWidget {
  @override
  _MysevicesState createState() => _MysevicesState();
}

class _MysevicesState extends State<Mysevices> {
  @override

  //virable

  //method

  Widget headmenu() {
    return DrawerHeader(
      decoration: BoxDecoration(),
      child: Column(
        children: <Widget>[
          Container(
            width: 90,
            height: 90.0,
            child: Image.asset('images/logo.png'),
            
          ),
          Text('Fai ory',style: TextStyle(
            
            color: Colors.pink,fontSize: 24.0,
          ),
          ),Text('Login By ...')
        ],
      ),
    );
  }

  Widget showDrawmenu() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        headmenu(),
      ],
    ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'My Sevices',
        ),
      ),
      body: Text('Body'),
      drawer: showDrawmenu(),
    );
  }
}
