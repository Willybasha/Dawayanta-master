import 'package:daawyenta/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int _page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    double _labelFontSize = 10;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: PageView(
        children: <Widget>[
          Container(child: ChatListScreen(),),
          Center(child: Text("Call Logs", style: TextStyle(color: Colors.black),)),
          Center(child: Text("Contact Screen", style: TextStyle(color: Colors.black),)),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CupertinoTabBar(
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.chat,
                    color: (_page == 0)
                        ? green
                        : Colors.grey),
                title: Text(
                  "Chats",
                  style: TextStyle(
                      fontSize: _labelFontSize,
                      color: (_page == 0)
                          ? green
                          : Colors.grey),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call,
                    color: (_page == 1)
                        ? green
                        : Colors.grey),
                title: Text(
                  "Calls",
                  style: TextStyle(
                      fontSize: _labelFontSize,
                      color: (_page == 1)
                          ? green
                          : Colors.grey),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_phone,
                    color: (_page == 2)
                        ? green
                        : Colors.grey),

                title: Text(
                  "Contacts",
                  style: TextStyle(
                      fontSize: _labelFontSize,
                      color: (_page == 2)
                          ? green
                          : Colors.grey),
                ),
              ),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}