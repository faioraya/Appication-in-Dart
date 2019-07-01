import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //Explicit
  double MyZise = 200;

  //Me mk[;kthod
  Widget showlogo() {
    return Container(
      width: MyZise,
      height: MyZise,
      child: Image.asset(
        'images/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText() {
    return Text(
      'Wwow look it That!!!',
      style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold,color: Colors.pink[800],fontFamily: 'THSarabunBold'
      )
  
    );
  }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[showlogo(), showText()],
        ),
      ),
    );
  }
}
