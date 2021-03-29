import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/Start.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool set=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daawyenta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:start() ,
    );
  }
}



