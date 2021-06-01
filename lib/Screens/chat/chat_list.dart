import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daawyenta/Network/chat_methods.dart';
import 'package:daawyenta/Network/firebase_repository.dart';
import 'package:daawyenta/Screens/call_screens/pickup/pickup_layout.dart';
import 'package:daawyenta/Screens/chat/search_screen.dart';
import 'package:daawyenta/Screens/chat/widgets/contant_veiw.dart';
import 'package:daawyenta/Screens/chat/widgets/new_chat.dart';
import 'package:daawyenta/Screens/chat/widgets/quiet_box.dart';
import 'package:daawyenta/Screens/chat/widgets/user_circle.dart';
import 'package:daawyenta/models/contant.dart';
import 'package:daawyenta/provider/user_provider.dart';
import 'package:daawyenta/utils/univesal_val.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/appbar.dart';

class ChatListScreen extends StatelessWidget {
  CustomAppBar customAppBar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      title: UserCircle(),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
          },
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: UniversalVariables.blackColor,
        appBar: customAppBar(context),
        floatingActionButton: NewChatButton(),
        body: ChatListContainer(),
      ),
    );
  }
}

class ChatListContainer extends StatelessWidget {
  final ChatMethods _chatMethods = ChatMethods();

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: _chatMethods.fetchContacts(
            userId: userProvider.getUser.uid,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var docList = snapshot.data.documents;

              if (docList.isEmpty) {
                return QuietBox();
              }
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: docList.length,
                itemBuilder: (context, index) {
                  Contact contact = Contact.fromMap(docList[index].data);

                  return ContactView(contact);
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}