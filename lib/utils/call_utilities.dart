import 'dart:math';

import 'package:daawyenta/Screens/call_screens/call_screen.dart';
import 'package:daawyenta/models/call.dart';
import 'package:daawyenta/models/user.dart';
import 'package:daawyenta/services/call_methods.dart';
import 'package:flutter/material.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({KUser from, KUser to, context}) async {
    Call call = Call(
      callerId: from.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallScreen(call: call),
          ));
    }
  }
}