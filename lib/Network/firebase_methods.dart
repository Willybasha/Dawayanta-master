
import 'dart:io';
import 'package:daawyenta/provider/image_upload_provider.dart';
import 'package:daawyenta/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart' ;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daawyenta/models/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:daawyenta/models/user.dart';

import '../constants.dart';
class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  static final Firestore firestore = Firestore.instance;

  static final CollectionReference _userCollection =
  _firestore.collection(USERS_COLLECTION);

  static final Firestore _firestore = Firestore.instance;

   StorageReference _storageReference;

  //user class
  KUser user = KUser();

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();

    return currentUser;
  }

  Future<KUser> getUserDetails() async {
    FirebaseUser currentUser = await getCurrentUser();

    DocumentSnapshot documentSnapshot =
    await _userCollection.document(currentUser.uid).get();

    return KUser.fromMap(documentSnapshot.data);
  }

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _signInAuthentication =
    await _signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: _signInAuthentication.accessToken,
        idToken: _signInAuthentication.idToken);

    FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    QuerySnapshot result = await firestore
        .collection(USERS_COLLECTION)
        .where(EMAIL_FIELD, isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = result.documents;

    //if user is registered then length of list > 0 or else less than 0
    return docs.length == 0 ? true : false;
  }

  Future<void> addDataToDb(FirebaseUser currentUser) async {
    String username = Utils.getUsername(currentUser.email);

    user = KUser(
        uid: currentUser.uid,
        email: currentUser.email,
        name: currentUser.displayName,
        profilePhoto: currentUser.photoUrl,
        phoneNumber: currentUser.phoneNumber,
        username: username
    );

    firestore
        .collection(USERS_COLLECTION)
        .document(currentUser.uid)
        .setData(user.toMap(user));
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    return await _auth.signOut();
  }

  Future<List<KUser>> fetchAllUsers(FirebaseUser currentUser) async {
    List<KUser> userList = List<KUser>();

    QuerySnapshot querySnapshot =
    await firestore.collection(USERS_COLLECTION).getDocuments();
    for (var i = 0; i < querySnapshot.documents.length; i++) {
      if (querySnapshot.documents[i].documentID != currentUser.uid) {
        userList.add(KUser.fromMap(querySnapshot.documents[i].data));
      }
    }
    return userList;
  }

  Future<void> addMessageToDb(
      Message message, KUser sender, KUser receiver) async {
    var map = message.toMap();

    await firestore
        .collection(MESSAGES_COLLECTION)
        .document(message.senderId)
        .collection(message.receiverId)
        .add(map);

    return await firestore
        .collection(MESSAGES_COLLECTION)
        .document(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    // mention try catch later on

    try {
      _storageReference = FirebaseStorage.instance
          .ref()
          .child('${DateTime.now().millisecondsSinceEpoch}');
      StorageUploadTask storageUploadTask =
      _storageReference.putFile(imageFile);
      var url = await (await storageUploadTask.onComplete).ref.getDownloadURL();
      // print(url);
      return url;
    } catch (e) {
      return null;
    }
  }

  void setImageMsg(String url, String receiverId, String senderId) async {
    Message message;

    message = Message.imageMessage(
        message: "IMAGE",
        receiverId: receiverId,
        senderId: senderId,
        photoUrl: url,
        timestamp: Timestamp.now(),
        type: 'image');

    // create imagemap
    var map = message.toImageMap();

    // var map = Map<String, dynamic>();
    await firestore
        .collection(MESSAGES_COLLECTION)
        .document(message.senderId)
        .collection(message.receiverId)
        .add(map);

    firestore
        .collection(MESSAGES_COLLECTION)
        .document(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }

  void uploadImage(File image, String receiverId, String senderId,
      ImageUploadProvider imageUploadProvider) async {
    // Set some loading value to db and show it to user
    imageUploadProvider.setToLoading();

    // Get url from the image bucket
    String url = await uploadImageToStorage(image);

    // Hide loading
    imageUploadProvider.setToIdle();

    setImageMsg(url, receiverId, senderId);
  }
}

void getUserDate (String user)async {
  var data = await Firestore.instance.collection(USERS_COLLECTION).document('${user}').get() ;
  print(data['name']) ;
}