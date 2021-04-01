import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'aftersignup.dart';

class signup2 extends StatefulWidget {
  @override
  _signup2State createState() => _signup2State();
}

class _signup2State extends State<signup2> {
  final List<String> genders =["Male","Female"];
  String selectedgender ="Male";
  final List<String> answers =["Yes","No"];
  String selectedanswer ='No';
  final List<String> diabetes =["Yes","No"];
  String diabetesanswer ='No';
  final List<String> pressure =["Yes","No"];
  String pressureanswer ='No';
  final List<String> medical =["Yes","No"];
  String medicalrec ='No';
  final List<String> allegry =["Yes","No"];
  String selectedallegry ='No';

  DateTime _datetime=DateTime.now();
  Future<Null>SelectDate(BuildContext Context)async{
    final DateTime Picked = await showDatePicker(
      context: Context,
      initialDate: _datetime,
      firstDate: DateTime(1960),
      lastDate: DateTime(2022),

    );
    if(Picked != null && Picked != _datetime){
     setState(() {
       _datetime=Picked;
     });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children:[ Column(children:[
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 100,top: 40),
                height: 60,
                child: Image.asset('assets/mini.jpg'),),
              SizedBox(width: 10,),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child:Text('Dawyenta',style: TextStyle(fontSize: 20),)),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30,bottom: 20),
            child: Text('Sign Up',style: TextStyle(fontSize: 20),),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                 width: double.infinity,
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(width: 1),
                 ),
                 child: Row(children: [
                       Expanded(child: Text('Select Gender',style: TextStyle(fontSize: 12),)),
                     SizedBox(width: 5,),
                     DropdownButton<String>
                       (value: selectedgender,
                     dropdownColor: Colors.grey,
                     onChanged:(value){
                         setState(() {
                          selectedgender=value;
                         });
                     },
                       items: genders.map<DropdownMenuItem<String>>((value){
                         return DropdownMenuItem(
                           child: Text(value),
                           value: value,);
                       }).toList(),
                     ),
                   ],
                 ),
                 ),

            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 60,
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(width: 1),
                 ),
                 child: Row(                 children: [
                   Expanded(child: Text('Enter your birthdate ',style: TextStyle(fontSize: 12),)),
                   Expanded(child: Text('${DateFormat('d/MM/yyyy').format(_datetime).toString()}')),
                   Expanded(
                     child: FlatButton(onPressed: (){
                       SelectDate(context);
                     },
                         child:Container(
                           margin: EdgeInsets.only(left: 80),
                             child: Icon(Icons.arrow_drop_down))),
                   ),

                 ],
                 ),
                 ),

             ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  Expanded(child: Text('Do You Have Diabetes?')),
                  SizedBox(width: 60),
                  DropdownButton<String>
                      (value: diabetesanswer,
                      onChanged:(value){
                        setState(() {
                          diabetesanswer=value;
                        });
                      },
                      items: diabetes.map<DropdownMenuItem<String>>((value){
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,);
                      }).toList(),
                    ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  Expanded(child: Text('Do You Have Pressure Disease?')),
                  SizedBox(width: 60),
                  DropdownButton<String>
                    (value: pressureanswer,
                    onChanged:(value){
                      setState(() {
                        pressureanswer=value;
                      });
                    },
                    items: pressure.map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,);
                    }).toList(),
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  Expanded(child: Text('Select Other medical Records')),
                  SizedBox(width: 60),
                   DropdownButton<String>
                    (value: medicalrec,
                    onChanged:(value){
                      setState(() {
                        medicalrec=value;
                      });
                    },
                    items: medical.map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,);
                    }).toList(),
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  Expanded(child: Text('Select any allegry if you have')),
                  SizedBox(width: 60),
                  DropdownButton<String>
                    (value: selectedallegry,
                    onChanged:(value){
                      setState(() {
                        selectedallegry=value;
                      });
                    },
                    items: allegry.map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,);
                    }).toList(),
                  ),

                ],
              ),
            ),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(
                builder: (ctx)=> aftersignup(),),);
            },
            child: Text(
              'Next',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            color: Color(0xff97b0bb),
          ),
          SizedBox(height: 20,),
          Text('Step 2/2',
            style: TextStyle(fontSize: 15,color: Colors.black54),)
    ],
        ),
    ],
      ),
    );
  }
}
