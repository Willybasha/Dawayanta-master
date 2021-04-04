import 'package:daawyenta/Network/firebase_repository.dart';
import 'package:daawyenta/Screens/Start.dart';
import 'package:flutter/material.dart';

class mydrawer extends StatefulWidget {
  @override
  _mydrawerState createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  FirebaseRepository _repository = FirebaseRepository() ;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color:Color(0xfff1c6e2),
            child: Center(child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRRefViTsx85xM_U01LKGg8JF353Bjkywkx8w&usqp=CAU'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Mohamed Waleed',
                  style: TextStyle(color: Colors.white,
                      fontSize: 20),),
                SizedBox(
                  height: 10,
                ),
                Text('Ledabasha@gmail.com',
                  style: TextStyle(color: Colors.white,
                      fontSize: 13),),
              ],
            )),
          ),
          ListTile(
            leading: Icon(Icons.apps),
            title: Text('My games'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text('Logout'),
            onTap: () {
              _repository.signOut().whenComplete(() {
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>start()));
                });

            });

            },
          ),
        ],
      ),
    );
  }
}