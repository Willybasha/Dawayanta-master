import 'package:daawyenta/Network/auth.dart';
import 'package:daawyenta/Network/firebase_repository.dart';
import 'package:daawyenta/Screens/aftersignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Signup.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Signup2.dart';

class start extends StatefulWidget {
  @override
  _startState createState() => _startState();
}
class _startState extends State<start> {
  @override
  final auth=FirebaseAuth.instance;
  FirebaseRepository _repository = FirebaseRepository();
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
   var Email=TextEditingController();
   var Password=TextEditingController();
   bool showspinner=false;
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: ListView(
          children:[ Column(
            children: [
              Container(
                child: Image.asset('assets/Artboard 79.jpg'),
              ),
              Form(
                key: _globalKey,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: new Theme(data: new ThemeData(
                        primaryColor: Colors.black,
                      ),
                        child: TextFormField(
                          controller: Email,
                        validator: (value){
                          if(value.isEmpty)
                          {return 'please Enter your email';}
                          },
                        decoration: new InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          labelText: "Username/Phone number",
                          labelStyle: new TextStyle(color: Colors.black),

                        ),
                      ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: new Theme(data: new ThemeData(
                        primaryColor: Colors.black,

                      ), child: TextFormField(
                        
                        controller: Password,
                        obscureText: true,
                        validator: (value){
                          // ignore: missing_return
                          if(value.isEmpty)
                          {return 'please enter your password';}
                        },
                        decoration: new InputDecoration(

                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            gapPadding: 20.0
                          ),
                          labelText: "Password",
                          labelStyle: new TextStyle(color: Colors.black),

                        ),
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 50,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: ()async{
                    setState(() {
                      showspinner=true;
                    });
                  if( _globalKey.currentState.validate()){
                  _globalKey.currentState.save();}
                        try {
                          final user = await auth.signInWithEmailAndPassword(
                          email: Email.text, password: Password.text);
                          if (user != null)
                          {Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => aftersignup()));}
                        }
                          catch(e)
                       { print(e);
                       setState(() {
                         showspinner=false;
                       });        }
                        },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  color: Color(0xff97b0bb),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //row for facebook and gmail button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 180,
                      child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        preformLogin();
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Icon(FontAwesomeIcons.googlePlusG,
                            color: Colors.white,),
                          ),
                          Text(
                            'Login with Gmail',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                      color: Colors.red,
                    ),),
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(
                  //       height: 50,
                  //       child: FlatButton(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20)),
                  //       onPressed: () {},
                  //       child: Row(
                  //         children: [
                  //         Expanded(
                  //           child: Icon(FontAwesomeIcons.facebookF,
                  //           color: Colors.white,),
                  //         ),
                  //           Text(
                  //             'login with facebook',
                  //             style: TextStyle(color: Colors.white, fontSize: 13),
                  //           ),
                  //         ],
                  //       ),
                  //       color: Colors.blue,
                  //     ),),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don,t have an Account?',
                  style: TextStyle(fontSize: 15),),
                  InkWell(
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(
                        builder: (ctx)=> signup(),),);
                    },
                    child: Text('Sign Up',style: TextStyle(fontSize: 15,
                        color: Color(0xff8ac4da)),),
                  )
                ],
              ),

                ],
          ),
        ]),
      ),
    );
  }

  void preformLogin() {
    _repository.signIn().then((User user) {
      if(user != null ){
        authenticateUser(user) ;
      }else{
        print('there is an error');
      }
    });
  }

  void authenticateUser(User user) {
    _repository.authenticateUser(user).then((isNewUser){
      if(isNewUser){
        _repository.addDataToDb(user).then((value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signup2(currentuser: user,)));
        });
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>aftersignup()));
      }
    });
  }
}
