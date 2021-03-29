import 'package:daawyenta/Screens/mydrawer.dart';
import 'package:daawyenta/Screens/questionstart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'result.dart';
class firstphase extends StatefulWidget {
  @override
  _firstphaseState createState() => _firstphaseState();
}

class _firstphaseState extends State<firstphase> {
  bool set =false;
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width:60,
                    decoration: BoxDecoration(
                      color: Color(0xfff1c6e2),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(100),bottomRight:Radius.circular(100)),
                    )),
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
                    decoration: BoxDecoration(
                      color: Color(0xfff1c6e2),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomLeft:Radius.circular(100)),
                    )),

              ],
            ),
          ),

        ),
      ),
      endDrawer: mydrawer(),
      backgroundColor: Colors.white,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
          Expanded(
            child: Stack(
              children: [
                Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.only(top: 110),
                    width: double.infinity,
                    height:double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xfff1c6e2),
                        borderRadius: BorderRadius.only(topRight:Radius.circular(50),topLeft: Radius.circular(50) )
                    ),
                    child: ListView.builder(
                      itemCount:20,
                      itemBuilder: (ctx,index)=>symptoms(),)

                ),
                Row(
            children: [
              SizedBox(
                width: 240,
              height:220,),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(
                      builder: (ctx)=>res(),),);
                    },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xff97b0bb),
                    child: Text('Next',style: TextStyle(fontSize: 30,color: Colors.white),),
                  ),
                ),
              ),

          ],),
           ] ),
          ),
           ],
      ),
    );
  }
  Widget symptoms()=>
      Container(
        margin: EdgeInsets.only(top:40),
        width:350,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(50),right: Radius.circular(50))
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text('task1',style: TextStyle(fontSize: 20),),
              Spacer(flex:1),
              Checkbox(
                  hoverColor: Colors.black,
                  activeColor: Color(0xfff1c6e2),
                  checkColor: Color(0xff97b0bb),
                  value: set,
                  onChanged:(bool val){
                    setState(() {
                      set=val;
                    });
                  } )
            ],
          ),
        ),
      );
}
