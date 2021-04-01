import 'package:daawyenta/Network/firebase_repository.dart';
import 'package:daawyenta/models/user.dart';
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
  KUser _user;
  FirebaseRepository _firebaseRepository = FirebaseRepository();

  KUser get getUser => _user;

  void refreshUser() async {
    KUser user = await _firebaseRepository.getUserDetails();
    _user = user;
    notifyListeners();
  }

}