import 'package:daawyenta/Screens/mydrawer.dart';
import 'package:daawyenta/Screens/question3.dart';
import 'package:flutter/material.dart';

import 'question3.dart';


class ques2 extends StatefulWidget {
  @override
  _ques2State createState() => _ques2State();
}

class _ques2State extends State<ques2> {
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
          actions: [
            IconButton(icon: Icon(Icons.arrow_back),
              onPressed:(){
                Navigator.pop(context);
              },
            )
          ],
          flexibleSpace: Container(
            child: Row(
              children: [
                Container(
                    width:60,
                    decoration: BoxDecoration(
                      color: Color(0xfff1c6e2),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(100),bottomRight:Radius.circular(100)),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10,top: 30 ),
                    child: Image.asset('assets/Mini.jpg',height: 80,width: 100,)),
                Container(
                    margin: EdgeInsets.only(top: 30 ),
                    child: Text('DAAWEYNTA',style: TextStyle(fontSize: 20,color: Colors.black),))
              ],
            ),
          ),
        ),
      ),
      drawer: mydrawer(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 130),
                    child: Image.asset('assets/Mini.jpg',width: 250,)),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: Text('Do you have fever?,',style: TextStyle(fontSize: 40))),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (ctx)=>que3(),),);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(top:40),
                    width:250,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xff97b0bb),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(50),right: Radius.circular(50))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 50),
                              child: Text('Yes i have',style: TextStyle(fontSize: 30),)),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (ctx)=>que3(),),);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(top:20),
                    width:300,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xff97b0bb),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(50),right: Radius.circular(50))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 50),
                              child: Text('No i have not',style: TextStyle(fontSize: 30),)),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (ctx)=>que3(),),);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(top:20),
                    width:240,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xff97b0bb),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(50),right: Radius.circular(50))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Text('I do not know',style: TextStyle(fontSize: 30),)),


                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),

    );
  }
}
