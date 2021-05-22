import 'package:daawyenta/Network/firebase_repository.dart';
import 'package:daawyenta/models/user.dart';
import 'package:daawyenta/provider/image_upload_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Network/api.dart';
import 'Screens/Start.dart';
import 'Screens/aftersignup.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // print('start') ;
  // await getModel() ;
  // print('end') ;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool set=false;
  FirebaseRepository _repository = FirebaseRepository() ;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageUploadProvider>(
      create: (context) => ImageUploadProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daawyenta',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: _repository.getCurrentUser(),
          builder: (context, snapshot ){
              if(snapshot.hasData){

                return aftersignup();
              }else{
                return start();
              }
          },
        ) ,
      ),
    );
  }
}



