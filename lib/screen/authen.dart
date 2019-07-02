import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //Explicit
  double MyZise = 200;

  //Method

  Widget signInButton() {
    return RaisedButton(
      child: Text('Sign In'),onPressed: (){
        
      },
    );
  }

  Widget myButton() {
    return Container(
      width: 220.0,
      child: Row(
        children: <Widget>[signInButton(), signInButton()],
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'More 6 Character',
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 220.0,
      // height: 220.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress, //จะมี@เเละ.comมาด้วย
        decoration: InputDecoration(
            labelText: 'Email :', hintText: 'lovefirve555@gmail.com'),
      ),
    );
  }

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
    return Text('Wwow look it That!!!',
        style: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.pink[800],
            fontFamily: 'THSarabunBold'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, //key board not move
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showlogo(), //jjjj
            showText(),
            emailText(),
            passwordText(),
            myButton(),
          ],
        ),
      ),
    );
  }
}
