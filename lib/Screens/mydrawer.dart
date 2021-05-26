import 'package:daawyenta/Network/firebase_repository.dart';
import 'package:daawyenta/Screens/Start.dart';
import 'package:daawyenta/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat/home_screen.dart';

class mydrawer extends StatefulWidget {
  final FirebaseUser LoggedinUser ;

  const mydrawer({Key key, this.LoggedinUser}) : super(key: key);
  @override
  _mydrawerState createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  FirebaseRepository _repository = FirebaseRepository() ;
  bool _loading = false ;
  // final _auth = FirebaseAuth.instance;
  // User loggedinuser;
  // Future<void> initState()  {
  //   super.initState();
  //   getcurrentuser();
  //
  // }
  // void getcurrentuser() async {
  //   try {
  //     final user = await _auth.currentUser;
  //     if (user != null) {
  //       loggedinuser = user;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading ,

      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color:green,
              child: Center(child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          '${widget.LoggedinUser.photoUrl}'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${widget.LoggedinUser.displayName}',
                    style: TextStyle(color: Colors.white,
                        fontSize: 20),),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${widget.LoggedinUser.email}',
                    style: TextStyle(color: Colors.white,
                        fontSize: 13),),
                ],
              )),
            ),
            ListTile(
              leading: Icon(Icons.chat_outlined),
              title: Text('chat'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())) ;
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Logout'),
              onTap: () {
                _repository.signOut().whenComplete(() {
                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>start()));
                  });

              });

              },
            ),
          ],
        ),
      ),
    );
  }
}