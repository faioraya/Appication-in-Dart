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
  final formkey = GlobalKey<FormState>();
  String emailString = '', passwordString = '';
  double MyZise = 200;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      //when you cick signin ปุ่มทำงานไหม
      onPressed: () {
        // print('YOu click!!');

        // formkey จะทำให้ emailString and password ทำงาน
        formkey.currentState.save();
        chackAuthan();
      },
    );
  }

  Future<void> chackAuthan() async {
    print('email = $emailString,password =$passwordString');
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Authan Success');
      moveservices();
    }).catchError((response) {
      // เเจ้งเตือนเมสเสจ
      String errorString = response.message;
      print('error=$errorString');
      myShowSnackBar(errorString);
    });
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
        //ดึงค่าจาก Stringpassword  extมาเก็บไว้ที่value
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: MyZise,
      // height: 220.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress, //จะมี@เเละ.comมาด้วย
        decoration: InputDecoration(labelText: 'Email :', hintText: ' '

            //ดึงค่าจากStringemailมาเก็บไว้ที่value
            ),
        onSaved: (String value) {
          emailString = value;
        },
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

  // เราจะโวยวายเมื่อเรากรอกรหัสผ่านไม่ถูกต้อง
  void myShowSnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      content: Text(messageString),
      backgroundColor: Colors.redAccent[100],
      duration: Duration(seconds: 4),

      //ปุ่มclose
      action: SnackBarAction(
        label: 'Close',textColor: Colors.blue,onPressed: (){

        },
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      //key board not move
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          //gradient ไล่สี
          colors: [Colors.pink[300], Colors.pink[100]], //ไล่สี
          begin: Alignment.topCenter, //ไล่ระดับสีว่าควรอยู่ตรงไหน
        )), //clors baeutiful
        padding: EdgeInsets.only(top: 100.0), //ห่างจากด้านบน 100
        alignment: Alignment.topCenter, //อยู่ตรงกลางไม่ว้ายไม่ขวา
        child: Form(
          key: formkey,
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
      ),
    );
  }
}
