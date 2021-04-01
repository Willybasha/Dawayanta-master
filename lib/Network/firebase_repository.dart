
import 'dart:io';

import 'package:daawyenta/models/message.dart';
import 'package:daawyenta/models/user.dart';
import 'package:daawyenta/provider/image_upload_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_methods.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<FirebaseUser> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<FirebaseUser> signIn() => _firebaseMethods.signIn();

  Future<KUser> getUserDetails() => _firebaseMethods.getUserDetails();

  Future<bool> authenticateUser(FirebaseUser user) =>
      _firebaseMethods.authenticateUser(user);

  Future<void> addDataToDb(FirebaseUser user) =>
      _firebaseMethods.addDataToDb(user);

  ///responsible for signing out
  Future<void> signOut() => _firebaseMethods.signOut();

  Future<List<KUser>> fetchAllUsers(User user) =>
      _firebaseMethods.fetchAllUsers(user);

  Future<void> addMessageToDb(Message message, User sender, User receiver) =>
      _firebaseMethods.addMessageToDb(message, sender, receiver);

  Future<String> uploadImageToStorage(File imageFile) =>
      _firebaseMethods.uploadImageToStorage(imageFile);

  // void showLoading(String receiverId, String senderId) =>
  //     _firebaseMethods.showLoading(receiverId, senderId);

  // void hideLoading(String receiverId, String senderId) =>
  //     _firebaseMethods.hideLoading(receiverId, senderId);

  void uploadImageMsgToDb(String url, String receiverId, String senderId) =>
      _firebaseMethods.setImageMsg(url, receiverId, senderId);

  void uploadImage(
      {@required File image,
        @required String receiverId,
        @required String senderId,
        @required ImageUploadProvider imageUploadProvider}) =>
      _firebaseMethods.uploadImage(
          image, receiverId, senderId, imageUploadProvider);
}