import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daawyenta/Network/firebase_repository.dart';
import 'package:daawyenta/enum/user_state.dart';
import 'package:daawyenta/models/user.dart';
import 'package:daawyenta/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OnlineDotIndicator extends StatelessWidget {
  final String uid;

  final FirebaseRepository _repository = FirebaseRepository() ;

  OnlineDotIndicator({
    @required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    getColor(int state) {
      switch (Utils.numToState(state)) {
        case UserState.Offline:
          return Colors.red;
        case UserState.Online:
          return Colors.green;
        default:
          return Colors.orange;
      }
    }

    return Align(
      alignment: Alignment.topRight,
      child: StreamBuilder<DocumentSnapshot>(
        stream: _repository.getUserStream(
          uid: uid,
        ),
        builder: (context, snapshot) {
          KUser user;

          if (snapshot.hasData && snapshot.data.data != null) {
            user = KUser.fromMap(snapshot.data.data);
          }

          return Container(
            height: 10,
            width: 10,
            margin: EdgeInsets.only(right: 5, top: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColor(user?.state),
            ),
          );
        },
      ),
    );
  }
}