import 'package:faiory/screen/authen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]) ;//Lock Scaeen not maove
    return MaterialApp(
      home: Authen(),
      
    );
  }
}
