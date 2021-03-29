import 'package:daawyenta/Screens/mydrawer.dart';
import 'package:daawyenta/Screens/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class que3 extends StatefulWidget {
  @override
  _que3State createState() => _que3State();
}
class _que3State extends State<que3> {
  var paintext="No Pain";
  double sliderval=0.0;
  IconData mypain =FontAwesomeIcons.smile;
  Color mypaincolor=Colors.green;
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
                    child: Image.asset('assets/mini.jpg',height: 80,width: 100,)),
                Container(
                    margin: EdgeInsets.only(top: 30 ),
                    child: Text('DAAWEYNTA',style: TextStyle(fontSize: 20,color: Colors.black),))
              ],
            ),
          ),
        ),
      ),
      drawer: mydrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Image.asset('assets/mini.jpg',width: 250,)),
            ),
           SizedBox(height:20,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               margin: EdgeInsets.only(left: 10),
               child: Text('ON scale of 1 to 10 ,How is the pain do you feel?',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
             ),
           ),
            SizedBox(height: 20,),

            Center(
              child: Column(
                children: [
                  Text(paintext,style: TextStyle(fontSize: 20,color: Colors.black),),
                  SizedBox(height: 10,),
                  Icon(mypain,color: mypaincolor,size: 70),
                  Slider(
                      value:sliderval,
                      min: 0,
                      max: 10,
                      divisions: 10,
                      activeColor: Color(0xfff1c6e2),
                      inactiveColor: Color(0xff97b0bb),
                      onChanged:(double val){
                        setState(() {
                          sliderval=val;
                          if(sliderval>=0 && sliderval<=1)
                            {
                              mypain=FontAwesomeIcons.laughBeam;
                              mypaincolor=Colors.green;
                              paintext='No Pain';
                            }
                          if(sliderval>=1 && sliderval<=3)
                          {
                            mypain=FontAwesomeIcons.smileBeam;
                            mypaincolor=Colors.lightGreen;
                            paintext='Mild';
                          }
                          if(sliderval>=4 && sliderval<=5)
                          {
                            mypain=FontAwesomeIcons.meh;
                            mypaincolor=Colors.yellow;
                            paintext='moderate';
                          }
                          if(sliderval>=5 && sliderval<=7)
                          {
                            mypain=FontAwesomeIcons.frown;
                            mypaincolor=Colors.orange;
                            paintext='moderate to severe';
                          }
                          if(sliderval>=7 && sliderval<=9)
                          {
                            mypain=FontAwesomeIcons.solidSadTear;
                            mypaincolor=Colors.deepOrange;
                            paintext='Severe';
                          }
                          if(sliderval>=9 && sliderval<=10)
                          {
                            mypain=FontAwesomeIcons.solidSadCry;
                            mypaincolor=Colors.red;
                            paintext='Very Severe';
                          }
                        });
                      }),
                  Text("$sliderval",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  FlatButton(

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (ctx)=>res()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    color: Color(0xff97b0bb),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
