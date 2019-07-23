import 'dart:io';

import 'package:faiory/screen/my_map.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; //ดึงค่าfirebase

class Mysevices extends StatefulWidget {
  @override
  _MysevicesState createState() => _MysevicesState();
}

class _MysevicesState extends State<Mysevices> {
  @override

  //virable
  FirebaseAuth firebaseAuth =
      FirebaseAuth.instance; //instane เพื่อเรียกใช้ firebase
  String nameString = '';
  //read firebase

  //method
  Widget signOnAnExit() {
    //icons
    return ListTile(
      leading: Icon(
        Icons.exit_to_app,
        size: 36.0,
        color: Colors.pink,
      ),
      title: Text(
        'Sign out & Exit',
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      onTap: () {
        mySignout();
      },
    );
  }

  Future<void> mySignout() async {
    //ทำfirebaseก่อน then
    await firebaseAuth.signOut().then((responce) {
      exit(0);
    }
    );
  }

  @override
  void initState() {
    //ทำงานก่อนbluid เสมอก็คือเอ่่String ค่า
    super.initState();
    findDisplayName();
  }

  //การเืทรดหาชื่อ
  //อย่าลืมเรียก findDisplayName
  Future<void> findDisplayName() async {
    //await ฉันรอที่จะหาได้
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    //setState เพื่อวาดภาพไปก่อน
    setState(() {
      nameString = firebaseUser.displayName;
    });
    print('name=$nameString');
  }

  Widget headmenu() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.pink[100], Colors.red[500]],
          radius: 1.5,
          center: Alignment.center,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 90,
            height: 90.0,
            child: Image.asset('images/logo.png'),
          ),
          Text(
            'Fai ory',
            style: TextStyle(
              color: Colors.pink,
              fontSize: 24.0,
            ),
          ),
          Text('Login By $nameString')
        ],
      ),
    );
  }

  Widget showDrawmenu() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        headmenu(),
        signOnAnExit(),
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
      body: MyMap(),
      drawer: showDrawmenu(),
    );
  }
}
