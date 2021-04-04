import 'package:daawyenta/Network/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/Start.dart';
import 'Screens/aftersignup.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool set=false;
  FirebaseRepository _repository = FirebaseRepository() ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daawyenta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context, snapshot ){
            if(snapshot.hasData){
              return start();
            }else{
              return start();
            }
        },
      ) ,
    );
  }
}



