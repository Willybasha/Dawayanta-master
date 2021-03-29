import 'package:daawyenta/Screens/Signup.dart';
import 'package:daawyenta/Screens/aftersignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Auth
{
final _auth=FirebaseAuth.instance;
final googlesign = GoogleSignIn();
Future signUp(String email,String password) async
  {
  try{
 final authresult=await _auth.createUserWithEmailAndPassword(email: email, password: password );
 FirebaseUser user =authresult.user;
 return authresult;}
 catch(e){
    switch(e.code){
      case 'ERRoR email already in use':
      return'already used';
    }
 }
  }

Future signIn(String email,String password) async
{
  try{
  final authresult = await _auth.signInWithEmailAndPassword(email: email, password: password);
  FirebaseUser user =authresult.user;
  return authresult;
  }
  catch(e){
    switch(e.code)
    {case'email is invalid':
    return 'invalid email ';
    }
  }
}

googlesignin()async{
GoogleSignInAccount googleSignInAccount =await googlesign.signIn();
if(googleSignInAccount != null)
  {
    GoogleSignInAuthentication googleSignInAuthentication =await googleSignInAccount.authentication;
    AuthCredential credential= GoogleAuthProvider.getCredential(idToken:googleSignInAuthentication.idToken ,
        accessToken:googleSignInAuthentication.accessToken);
    final authresult = await _auth.signInWithCredential(credential);
    FirebaseUser user = await _auth.currentUser;
    return Future.value(true);

  }
}
Future SignOutUser()async{
  FirebaseUser user = await _auth.currentUser;
  if(user.providerData[1].providerId == 'google.com')
  {await _auth.signOut();}
  await googlesign.signOut();
}

}