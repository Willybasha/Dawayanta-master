import 'package:daawyenta/Screens/mydrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class res extends StatefulWidget {
  @override
  _resState createState() => _resState();
}

class _resState extends State<res> {
  final _auth = FirebaseAuth.instance;
  User loggedinuser;
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
      final user = await _auth.currentUser;
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width:60,

                ),
                Expanded(
                  child: Row(
                      children:[
                        Container(
                            margin: EdgeInsets.only(top: 30,left: 30 ),
                            child: Image.asset('assets/mini.jpg',height: 80,width: 100,)),
                        Container(
                            margin: EdgeInsets.only(top: 30 ),
                            child: Text('DAAWEYNTA',style: TextStyle(fontSize: 20,color: Colors.black),)),]
                  ),
                ),

                Container(
                    width:60,
                    // decoration: BoxDecoration(
                    //   color: Color(0xfff1c6e2),
                    //   borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomLeft:Radius.circular(100)),
                    // )
                ),

              ],
            ),
          ),

        ),
      ),
      endDrawer: mydrawer(LoggedinUser: loggedinuser,),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Text('The result',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  Color(0xff97b0bb),
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('First D',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      Padding(padding: const EdgeInsets.all(5),
                        child: Text('Descriptions',style: TextStyle(fontSize: 27,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 40,),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: RaisedButton(
                                elevation: 8,
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,
                              color: Color(0xfff1c6e2),
                                onPressed:(){},
                                child:Text('Go to next phase',style: TextStyle(fontSize:25,color: Colors.white),)),),
                        ),
                        SizedBox(width: 10,),
                        Text('30%',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),)
                      ],)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(

                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  Color(0xff97b0bb),
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Second D',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      Padding(padding: const EdgeInsets.all(5),
                        child: Text('Descriptions',style: TextStyle(fontSize: 27,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 40,),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: RaisedButton(
                                elevation: 8,
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,
                                color: Color(0xfff1c6e2),
                                onPressed:(){},
                                child:Text('Go to next phase',style: TextStyle(fontSize:25,color: Colors.white),)),),
                        ),
                        SizedBox(width: 10,),
                        Text('30%',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),)
                      ],)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  Color(0xff97b0bb),
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Third D',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      Padding(padding: const EdgeInsets.all(5),
                        child: Text('Descriptions',style: TextStyle(fontSize: 27,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 40,),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: RaisedButton(
                              elevation: 8,
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,
                                color: Color(0xfff1c6e2),
                                onPressed:(){},
                                child:Text('Go to next phase',style: TextStyle(fontSize:25,color: Colors.white),)),),
                        ),
                        SizedBox(width: 10,),
                        Text('30%',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),)
                      ],)
                    ],
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
