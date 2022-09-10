// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_twitter_1/Constants/Contstants.dart';
import 'package:flutter_twitter_1/Services/auth_service.dart';
import 'package:flutter_twitter_1/widgets/RoundedButton.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
late String _email;
  // ignore: unused_field
late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KTweeterColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Log in",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ignore: prefer_const_literals_to_create_immutables
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center, // jodi tumi textfield guluk 
          children: [
          SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your email",
            ),
            onChanged: (value) {
              setState(() {
                _email = value;
              });
              
            },
          ),
          SizedBox(height: 20,),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter your password",
            ),
            onChanged: (value) {
              _password = value;
            },
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
                elevation: 5,
                color: KTweeterColor,  //Color(0xff00acee),
                child: const Text('LOG IN', style: TextStyle(color: Colors.white, fontSize: 20),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                onPressed: () async{
                  bool isValid = await AuthService.Login(_email, _password);

                  if(isValid){
                    Navigator.pop(context);
                  }
                  else{
                    print('login problem');
                  }
                },
               // minWidth: 320,
                //height: 60,
              ),
        ]),
      ),
    );
  }
}
