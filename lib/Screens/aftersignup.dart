import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daawyenta/Network/firebase_methods.dart';
import 'package:daawyenta/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';
import 'firstphase.dart';
import 'mydrawer.dart';

class aftersignup extends StatefulWidget {
  final  user ;

  const aftersignup({Key key, this.user}) : super(key: key);
  @override
  _aftersignupState createState() => _aftersignupState();
}

class _aftersignupState extends State<aftersignup> {
  final List<String> answers = ["for me", "for another one"];
  bool _loading = false ;
  String selectedanswer = "for me";
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedinuser;
  Future<void> initState()  {
    super.initState();
    getcurrentuser();

  }

  void getcurrentuser() async {
    try {
      setState(() {
        _loading = true ;
      });
      final user = await _auth.currentUser();
      if (user != null) {
        loggedinuser = user;
      }
      setState(() {
        _loading = false ;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: new IconThemeData(color: Colors.black),
            flexibleSpace: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Row(children: [
                        Container(
                            margin: EdgeInsets.only(top: 30, left: 30),
                            child: Image.asset(
                              'assets/mini.jpg',
                              height: 80,
                              width: 100,
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text(
                              'DAAWEYNTA',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )),
                      ]),
                    ),
                  ),

                  // Container(
                  //     width:60,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xfff1c6e2),
                  //       borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomLeft:Radius.circular(100)),
                  //     )),
                ],
              ),
            ),
          ),
        ),
        drawer: mydrawer(LoggedinUser: loggedinuser,),
        body: ModalProgressHUD(
          inAsyncCall: _loading ,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("Welcome ${loggedinuser.displayName},",style: TextStyle(
                            color:  Colors.black45,
                            fontSize: 26.0
                          ),),
                          Text("let's start the consultant ",style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15.0
                          ),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Is it for you or for another one?',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          DropdownButton<String>(
                            value: selectedanswer,
                            dropdownColor: Colors.grey,
                            onChanged: (value) {
                              setState(() {
                                selectedanswer = value;
                              });
                            },
                            items: answers.map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 12),
                                ),
                                value: value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Select Department',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DropdownButton<String>(
                            value: selectedanswer,
                            dropdownColor: Colors.grey,
                            onChanged: (value) {
                              setState(() {
                                selectedanswer = value;
                              });
                            },
                            items: answers.map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 12),
                                ),
                                value: value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => firstphase(),
                        ),
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    color: Color(0xff97b0bb),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/covid2.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xfff1c6e2),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Learn About',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'Covid-19',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xfff1c6e2),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(top: 40, left: 30),
                                height: 120,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        topRight: Radius.circular(100),
                                        bottomLeft: Radius.circular(100),
                                        bottomRight: Radius.circular(40)),
                                    color: Color(0xff97b0bb)),
                                child: Text(
                                  'About US',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 330,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              image: DecorationImage(
                                  image: AssetImage('assets/new1.jpg'),
                                  fit: BoxFit.cover)),
                          child: Center(
                              child: Text(
                            'News',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
