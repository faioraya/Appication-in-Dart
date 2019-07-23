import 'package:faiory/screen/mysevices.dart';
import 'package:faiory/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //Explicit
  double MyZise = 200;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Method
  @override
  //ทำงานก่อนเมตอดบิ้ว
  void initState() {
    super.initState();
    chackStatus();
  }

  Future<void> chackStatus() async {
    //เก็บเดต้าดึงจากไฟล์เบตมาอีกที
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    if (firebaseUser != null) {
      moveservices();
    }
  }

  void moveservices() {
    var servicesRoute =
        MaterialPageRoute(builder: (BuildContext context) => Mysevices());
    Navigator.of(context)
        .pushAndRemoveUntil(servicesRoute, (Route<dynamic> route) => false);
  }

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
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context)
            .pushAndRemoveUntil(registerRoute, (Route<dynamic> route) => false);
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
            labelText: 'Email :', hintText: ' '),
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
      //key board not move
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          //gradient ไล่สี
          colors: [Colors.pink[300], Colors.pink[100]], //ไล่สี
          begin: Alignment.topCenter, //ไล่ระดับสีว่าควรอยู่ตรงไหน
        )
        ), //clors baeutiful
        padding: EdgeInsets.only(top: 100.0), //ห่างจากด้านบน 100
        alignment: Alignment.topCenter, //อยู่ตรงกลางไม่ว้ายไม่ขวา
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
