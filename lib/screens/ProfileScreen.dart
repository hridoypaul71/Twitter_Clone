// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_twitter_1/Constants/Contstants.dart';
import 'package:flutter_twitter_1/Models/UserModel.dart';
import 'package:flutter_twitter_1/Services/DatabaseServices.dart';

class ProfileScreen extends StatefulWidget {
  final String currentUserId;
  final String visitedUserId;
  ProfileScreen(
      {Key? key, required this.currentUserId, required this.visitedUserId})
      : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _followersCount = 0;
  int _followingCount = 0;

  getFollowersCount() async {
    int followersCount =
        await DatabaseServices.followersNum(widget.visitedUserId);
    if (mounted) {
      setState(() {
        _followersCount = followersCount;
      });
    }
  }

  getFollowingCount() async {
    int followingCount =
        await DatabaseServices.followingNum(widget.visitedUserId);
    if (mounted) {
      setState(() {
        _followingCount = followingCount;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getFollowersCount();
    getFollowingCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: usersRef.doc(widget.visitedUserId).get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(KTweeterColor),
                  ),
                );
              }
              UserModel userModel = UserModel.fromDoc(snapshot.data);
              return ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: KTweeterColor,
                        image: userModel.coverImage.isEmpty
                            ? null
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(userModel.coverImage),
                              )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox.shrink(),
                          PopupMenuButton(
                              icon: Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                                size: 30,
                              ),
                              itemBuilder: (_) {
                                return <PopupMenuItem<String>>[
                                  new PopupMenuItem(
                                    child: Text("Logout"),
                                    value: "logout",
                                  )
                                ];
                              },
                              onSelected: (selectedItem){}
                              )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: UserModel.profilePicture.isEmpty
                          ?                            AssetImage("assets/placeholder.png")
                          : NetworkImage(userModel.profilePicture)
                        ),
                        Container(
                          width: 100,
                          height: 35,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(  
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: KTweeterColor),
                          ),
                        )
                      ],
                    )
                  )
                ],
              );
            }));
  }
}
