import 'package:faiory/screen/mysevices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//Explicit
  final formkey =
      GlobalKey<FormState>(); //formState=เก็บค่าได้หลายค่าประกาศตัวเเปร
  String nemeString, emailString, passwordString; //ประกาศเพื่อเก็บค่า
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//Method
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(color: Colors.red[100]),
        helperText: 'Show Display Name',
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: Colors.pink[20],
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please fill name in Blank';
        }
      },
      onSaved: (String value) {
        nemeString = value;
      }, //if you fill up in teh blank will save in to value
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.red[10]),
        helperText: 'More 6 character',
        icon: Icon(
          Icons.lock,
        ),
      ),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Pass much more 6 character';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.red[100]),
        helperText: 'Type Email',
        icon: Icon(
          Icons.email,
        ),
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Type Email Format';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Power Up_(Upload)');
        if (formkey.currentState.validate()) {
          //ถ้้า validateไม่ผิดพลากค่าจะกลายเป้น true เเต่ถ้า ผิด จะขึ้นค่าPlease fill name in Blank
          formkey.currentState.save();
          print(
              'Name = $nemeString,Email =$emailString,Password = $passwordString');
          register();
        }
      },
    );
  }

  Future<void> register() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailString,
      password: passwordString,
    )
        .then((objResponse) {
      //objres... = virable
      print('Register Success');
      setUpDisplayName();
      //catchError = เช็คemal passwordห้ามซ้ำ
    }).catchError((objResponse) {
      print('${objResponse.toString()}');
      myAlert(objResponse.code.toString(), objResponse.message.toString());
    });
  }

  Future<void> setUpDisplayName() async {
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = nemeString;
      response.updateProfile(updateInfo);

      var servicesRoute =
          MaterialPageRoute(builder: (BuildContext context) => Mysevices());
      Navigator.of(context).push(servicesRoute);
    });
  }

  void myAlert(String titleString, String messageString) {
    showDialog(
      //
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleString,
            style: TextStyle(color: Colors.pink),
          ),
          content: Text(messageString),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
      ),
      body: Form(
        key: formkey,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/vic.jpg'), fit: BoxFit.cover)),
          alignment: Alignment.topCenter, //กลาง
          padding: EdgeInsets.only(top: 60.0), //ทอปบน
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration:
                BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.75)),
            width: 300.0,
            height: 300,
            child: Column(
              children: <Widget>[nameText(), emailText(), passwordText()],
            ),
          ),
        ),
      ),
    );
  }
}
