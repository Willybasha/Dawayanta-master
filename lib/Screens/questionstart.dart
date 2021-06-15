import 'package:daawyenta/Screens/mydrawer.dart';
import 'package:daawyenta/Screens/question2.dart';
import 'package:flutter/material.dart';
import 'question2.dart';

class questart extends StatefulWidget {
  @override
  _questartState createState() => _questartState();
}

class _questartState extends State<questart> {

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
                  child: Text('HI,',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold))),
              Container(
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: Text('Iam Daawyenta,',style: TextStyle(fontSize: 40))),
              Container(
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: Text('I need to ask you some questions.',style: TextStyle(fontSize: 30))),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 150,

                  child: FlatButton(

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(
                        builder: (ctx)=> ques2(),),);
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    color: Color(0xff97b0bb),
                  ),
                ),
              )


            ],
          ),
        ],
      ),

    );

  }
}
