import 'package:daawyenta/Network/firebase_repository.dart';
import 'package:daawyenta/Screens/chat/widgets/cutom_tile.dart';
import 'package:daawyenta/constants.dart';
import 'package:daawyenta/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FirebaseRepository _repository = FirebaseRepository();

  List<KUser> userList;
  String query = "";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _repository.getCurrentUser().then((User user) {
      _repository.fetchAllUsers(user).then((List<KUser> list) {
        setState(() {
          userList = list.cast<KUser
          >();
        });
      });
    });
  }

  searchAppBar(BuildContext context) {
    return AppBar(

      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: TextField(
            controller: searchController,
            onChanged: (val) {
              setState(() {
                query = val;
              });
            },
            cursorColor: Colors.black,
            autofocus: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 35,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => searchController.clear());
                },
              ),
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0x88ffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildSuggestions(String query) {
    final List<KUser> suggestionList = query.isEmpty
        ? []
        : userList.where((KUser user) {
      String _getUsername = user.username.toLowerCase();
      String _query = query.toLowerCase();
      String _getName = user.name.toLowerCase();
      bool matchesUsername = _getUsername.contains(_query);
      bool matchesName = _getName.contains(_query);

      return (matchesUsername || matchesName);

      // (User user) => (user.username.toLowerCase().contains(query.toLowerCase()) ||
      //     (user.name.toLowerCase().contains(query.toLowerCase()))),
    }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: ((context, index) {
        KUser searchedUser = KUser(
            uid: suggestionList[index].uid,
            profilePhoto: suggestionList[index].profilePhoto,
            name: suggestionList[index].name,
            username: suggestionList[index].username);

        return CustomTile(
          mini: false,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      receiver: searchedUser,
                    )));
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(searchedUser.profilePhoto),
            backgroundColor: Colors.grey,
          ),
          title: Text(
            searchedUser.username,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            searchedUser.name,
            style: TextStyle(color: Colors.grey),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: searchAppBar(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: buildSuggestions(query),
      ),
    );
  }
}

//  return ListView.builder(
//       itemCount: suggestionList.length,
//       itemBuilder: ((context, index) {
//         User searchedUser = User(
//             uid: suggestionList[index].uid,
//             profilePhoto: suggestionList[index].profilePhoto,
//             name: suggestionList[index].name,
//             username: suggestionList[index].username);

//         return CustomTile(
//           mini: false,
//           onTap: () {;
//           },
//           leading: CircleAvatar(
//             backgroundImage: NetworkImage(searchedUser.profilePhoto),
//             backgroundColor: Colors.grey,
//           ),
//           title: Text(
//             searchedUser.username,
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           subtitle: Text(
//             searchedUser.name,
//             style: TextStyle(color: UniversalVariables.greyColor),
//           ),
//         );
//       }),
//     );
