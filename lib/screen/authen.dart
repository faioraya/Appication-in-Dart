import 'package:faiory/screen/register.dart';
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
  Widget mySizeBox() {
    return SizedBox(
      width: 8.0,
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.white,
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.pink),
      ),
      onPressed: () {
        print('You Click Sign UP');

        //create Route
        //avr=ประกาศopject
        var registerRoute = MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.white,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.pink),
      ),
      onPressed: () {},
    );
  }

  Widget myButton() {
    return Container(
      width: MyZise,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInButton(),
          ),
          mySizeBox(),
          Expanded(
            child: signUpButton(),
          ),
        ],
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: MyZise,
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
      width: MyZise,
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
            color: Colors.pink[800], //color
            fontFamily: 'THSarabunBold'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, //key board not move
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.pink[300], Colors.pink[100]],
          begin: Alignment.topCenter,
        )), //clors baeutiful
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
