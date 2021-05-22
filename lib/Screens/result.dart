import 'package:daawyenta/Network/api.dart';
import 'package:daawyenta/Screens/mydrawer.dart';
import 'package:daawyenta/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class res extends StatefulWidget {
  final symptoms  ;
  const res({Key key, this.symptoms}) : super(key: key);

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
      body: FutureBuilder(
        future: getModel(symptoms: widget.symptoms),
        builder: (context , snapshot){
          if(snapshot.hasData){
            var data = snapshot.data['predict'] ;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context , index){
                double prec = data[index][1][0] ;
                prec.toStringAsFixed(2) ;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  Color(0xff97b0bb).withOpacity(0.2),
                    ),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${data[index][0]}',style: TextStyle(fontSize: 25,color: Colors.black54,fontWeight: FontWeight.bold),),
                        ),

                        SizedBox(height: 40,),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: RaisedButton(
                                  elevation: 8,
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,
                                  color: Color(0xfff1c6e2).withOpacity(0.4),
                                  onPressed:(){},
                                  child:Text('check doctor',style: TextStyle(fontSize:25,color: Colors.black54),)),),
                          ),
                          SizedBox(width: 30,),
                          //Expanded(child: Text('${prec.toStringAsFixed(2)}%',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),))
                          CircularPercentIndicator(
                            progressColor:pink ,

                            radius: 100.0,
                            lineWidth: 13.0,
                            animation: true,
                            percent: prec/100,
                            center: new Text(
                              "${prec.toStringAsFixed(2)}",
                              style:
                              new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                            )
                          )],)
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Container(width : MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

                child: Center(child: CircularProgressIndicator()));
          }
        },

      ),
    );
  }
}
