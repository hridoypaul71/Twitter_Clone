// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CreateTweetScreen extends StatefulWidget {
  CreateTweetScreen({Key? key}) : super(key: key);

  @override
  State<CreateTweetScreen> createState() => _CreateTweetScreenState();
}

class _CreateTweetScreenState extends State<CreateTweetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(  
        child: Text("create tweet"),
      ),
    );
  }
}