import 'package:daawyenta/Network/api.dart';
import 'package:daawyenta/Screens/mydrawer.dart';
import 'package:daawyenta/Screens/questionstart.dart';
import 'package:daawyenta/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'result.dart';
class firstphase extends StatefulWidget {
  @override
  _firstphaseState createState() => _firstphaseState();
}

class _firstphaseState extends State<firstphase> {
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  var symptoms = TextEditingController() ;
  String symptomsEntered ;
  bool set =false;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedinuser;
  bool _loading = false ;
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          flexibleSpace: Container(
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //     width:60,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xfff1c6e2),
                  //       borderRadius: BorderRadius.only(topRight: Radius.circular(100),bottomRight:Radius.circular(100)),
                  //     )),
                  Row(
                   children:[
                     Container(
                        child: Image.asset('assets/mini.jpg',height: 80,width: 100,)),
                  Container(
                      child: Text('DAAWEYNTA',style: TextStyle(fontSize: 20,color: Colors.black),)),]
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
      ),
      drawer: mydrawer(LoggedinUser: loggedinuser,),
      backgroundColor: Colors.white,
      body: Column(

        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text("Check Your Symptoms",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          Column(
            children: [
              // Container(
              //     padding: EdgeInsets.all(12),
              //     margin: EdgeInsets.only(top: 110),
              //     width: double.infinity,
              //     height:double.infinity,
              //     decoration: BoxDecoration(
              //         color: Color(0xfff1c6e2),
              //         borderRadius: BorderRadius.only(topRight:Radius.circular(50),topLeft: Radius.circular(50) )
              //     ),
              //     child: ListView.builder(
              //       itemCount:20,
              //       itemBuilder: (ctx,index)=>symptoms(),)
              //
              // ),
          //       Row(
          //   children: [
          //     SizedBox(
          //       width: 240,
          //     height:220,),
          //     Expanded(
          //       child: GestureDetector(
          //         onTap: (){
          //           Navigator.push(context,MaterialPageRoute(
          //             builder: (ctx)=>res(),),);
          //           },
          //         child: CircleAvatar(
          //           radius: 50,
          //           backgroundColor: Color(0xff97b0bb),
          //           child: Text('Next',style: TextStyle(fontSize: 30,color: Colors.white),),
          //         ),
          //       ),
          //     ),
          //
          // ],),
          Form(
            key: _globalKey,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              child: TextFormField(
                controller: symptoms ,
                maxLines: 9,
                validator: (value){
                  // ignore: missing_return
                  if(value.isEmpty)
                  {return 'please Enter your symptoms';}
                },
                keyboardType: TextInputType.name,
                decoration: new InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    gapPadding: 50.0,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: const BorderSide(color: Colors.black, width: 0.0),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: "Enter Symptoms",
                  labelStyle: new TextStyle(color: Colors.black ,fontSize: 25.0),
                ),
              ),
            ),
          )),

           ] ),
          SizedBox(
            height: 25.0,
          ),
          Material(
            borderRadius: BorderRadius.circular(10.5),
            elevation: 5.0,
            child: Container(
              width: 120.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(10.5)
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10.5),
                onTap: ()async{
                  if(_globalKey.currentState.validate()){
                    _globalKey.currentState.save() ;
                    symptomsEntered = symptoms.text ;
                    print('$symptomsEntered') ;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => res(symptoms: symptomsEntered,))) ;
                  }
                },
                child: Center(child: Text('Get results', style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold ,
                  color: Colors.white
                ),)),
              ),
            ),
          )
           ],
      ),
    );
  }
}
