import 'package:daawyenta/Network/auth.dart';
import 'package:daawyenta/Screens/Signup2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}
class _signupState extends State<signup> {
  var Username = TextEditingController();
  var Firstname = TextEditingController();
  var Secondname = TextEditingController();
  var Password = TextEditingController();
  var ConfirmPassword = TextEditingController();
  var E_mail = TextEditingController();
  var PhoneNumber = TextEditingController();
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  save({String Username, String Firstname, String Secondname,String Password,String ConfirmPassword, String E_mail,String PhoneNumber})async{
    final prefs= await SharedPreferences.getInstance();
    final keyusername="Username";
    final keyFirstname="Firstname";
    final keySecondname="Secondname";
    final keypassword="password";
    final keyConafirmPassword="ConfirmPassword";
    final keyE_mail="E_mail";
    final keyphonenumber="Phonenumber";
    final valueUsername=Username;
    final valueFirstname=Firstname;
    final valueSecondName=Secondname;
    final valuePassword=Password;
    final valueConfirmPassword=ConfirmPassword;
    final valuePhoneNUmber=PhoneNumber;
    final valueE_mail=E_mail;
    prefs.setString(keyusername,valueUsername);
    prefs.setString(keyFirstname,valueFirstname);
    prefs.setString(keySecondname,valueSecondName);
    prefs.setString(keypassword,valuePassword);
    prefs.setString(keyConafirmPassword,valueConfirmPassword);
    prefs.setString(keyE_mail,valueE_mail);
    prefs.setString(keyphonenumber,valuePhoneNUmber);
  }
  read()async{
    final prefs=await SharedPreferences.getInstance();
    final keyusername="Username";
    final keyFirstname="Firstname";
    final keySecondname="Secondname";
    final keypassword="password";
    final keyConafirmPassword="ConfirmPassword";
    final keyE_mail="E_mail";
    final keyphonenumber="Phonenumber";
    final valueUsername = prefs.get(keyusername)?? null;
    final valueFirstname = prefs.get(keyFirstname)?? null;
    final valueSecondname = prefs.get(keySecondname)?? null;
    final valuePassword = prefs.get(keypassword)?? null;
    final valueConfirmPassword = prefs.get(keyConafirmPassword)?? null;
    final valueE_mail = prefs.get(keyE_mail)?? null;
    final valuePhoneNumber = prefs.get(keyphonenumber)?? null;
    print("${valueUsername},${valueFirstname},${valueSecondname},${valuePassword},${valueConfirmPassword},${valueE_mail},${valuePhoneNumber}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              Form(
                key: _globalKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30,bottom: 20),
                      child: Text('Sign Up',style: TextStyle(fontSize: 20),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: Username,
                        validator: (value){
                          // ignore: missing_return
                          if(value.isEmpty)
                          {return 'please Enter your user name';}
                        },
                        keyboardType: TextInputType.name,
                        decoration: new InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: "Username",
                          labelStyle: new TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: Firstname,
                        validator: (value){
                          if(value.isEmpty)
                            // ignore: missing_return
                              {return 'please Enter your First name';}
                        },
                        keyboardType: TextInputType.name,
                        decoration: new InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: "First name",
                          labelStyle: new TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: Secondname,
                        validator: (value){
                          if(value.isEmpty)
                            // ignore: missing_return
                              {return 'Please enter your Second name';}
                        },
                        keyboardType: TextInputType.name,
                        decoration: new InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: "Second name",
                          labelStyle: new TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: E_mail,
                        validator: (value){
                          // ignore: missing_return, missing_return
                          if(value.isEmpty)
                          {return 'please enter E-mail';}
                          if(!RegExp("^[a-zA-z0-9+_.-]+.[a-z]").hasMatch(value))
                            {return 'please enter valid email';}
                        },
                        decoration: new InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: "E-mail",
                          labelStyle: new TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: Password,
                        validator: (value){
                          if(value.isEmpty)
                            // ignore: missing_return, missing_return
                              {return 'please Enter your password';}
                        },
                        decoration: new InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: "Password",
                          labelStyle: new TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        controller:ConfirmPassword,
                        validator: (value){
                          // ignore: missing_return, missing_return
                          if(value.isEmpty)
                          { return 'please confirm your password';}
                          if(Password.text != ConfirmPassword.text)
                            {return 'password do not match';}
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: "Conirm Password",
                          labelStyle: new TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: PhoneNumber,
                        validator: (value){
                          // ignore: missing_return
                          if(value.isEmpty)
                          {return 'please enter your phone number';}
                        },
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: "Phone number",
                          labelStyle: new TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        if( _globalKey.currentState.validate()){
                          _globalKey.currentState.save();
                            if(Password.text == ConfirmPassword.text){
                            save(Username: Username.text,Firstname: Firstname.text,Secondname: Secondname.text,Password: Password.text,ConfirmPassword: ConfirmPassword.text,E_mail: E_mail.text,PhoneNumber: PhoneNumber.text);
                            read();
                              Auth().signUp(E_mail.text, Password.text);
                              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>signup2()));
                            }

                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      color: Color(0xff97b0bb),
                    ),
                    SizedBox(height: 20,),
                    Text('Step 1/2',
                      style: TextStyle(fontSize: 15,color: Colors.black54),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}


