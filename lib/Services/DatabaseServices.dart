import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_twitter_1/Constants/Contstants.dart';
//import 'package:flutter/material.dart';

class DatabaseServices {
  
  static Future<int> followersNum(String userId) async {
    QuerySnapshot followerSnapshot =
        await followersRef.doc(userId).collection("userFollowers").get();

    return followerSnapshot.docs.length;
  }

    static Future<int> followingNum(String userId) async {
    QuerySnapshot followingSnapshot =
        await followingRef.doc(userId).collection("userFollowing").get();

    return followingSnapshot.docs.length;
  }
}
