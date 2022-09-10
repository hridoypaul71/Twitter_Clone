// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_1/Constants/Contstants.dart';
import 'package:flutter_twitter_1/screens/CreateTweetScreen.dart';
import 'package:flutter_twitter_1/screens/HomeScreen.dart';
import 'package:flutter_twitter_1/screens/NotificationsScreen.dart';
import 'package:flutter_twitter_1/screens/ProfileScreen.dart';
import 'package:flutter_twitter_1/screens/SearchScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedScreen extends StatefulWidget {
  final String currentUserId;
  const FeedScreen({Key? key, required this.currentUserId}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int selectedTab = 0;
  // ignore: prefer_final_fields
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
    HomeScreen(),
    SearchScreen(),
    NotificationsScreen(),
    ProfileScreen(
      currentUserId: widget.currentUserId,
      visitedUserId: widget.currentUserId,
    ),
  ].elementAt(selectedTab),
      floatingActionButton: FloatingActionButton(
        // child: FaIcon(FontAwesomeIcons.add),
        child: Image.asset("assets/tweet.png"),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateTweetScreen()));
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        activeColor: KTweeterColor, //Color(0xff00acee),
        currentIndex: selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
