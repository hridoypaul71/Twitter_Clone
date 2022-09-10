// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_twitter_1/Constants/Contstants.dart';
import 'package:flutter_twitter_1/Services/auth_service.dart';
import 'package:flutter_twitter_1/widgets/RoundedButton.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

// ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
class _RegistrationScreenState extends State<RegistrationScreen> {
  // ignore: unused_field
  late String _name;
  late String _email;
  late String _password;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KTweeterColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Registration",
          style: TextStyle(
            fontSize: 20, //20 korte hobe
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center, // jodi tumi textfield guluk
            children: [
              SizedBox(
                height: 18,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (value) {
                  _email = value;
                },
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: 40, //40 korte hobe
              ),
             MaterialButton(
                elevation: 5,
                color: KTweeterColor,
                child: const Text('Create account', style: TextStyle(color: Colors.white, fontSize: 20),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                onPressed: () async{
                  bool isValid = await AuthService.signup(_name, _email, _password);

                  if(isValid){
                    Navigator.pop(context);
                  }
                  else{
                    print('Something wrong');
                  }
                },
                //minWidth: 320,
               // height: 60,
              ),
             
             
             
              // RoundedButton(
              //     btnText: "Create account",
              //     onBtnPressed: () async {
              //       isVaild =
              //           await AuthService.signup(_name, _email, _password);

              //       if (isVaild) {
              //         //isValid er error shoranur jonno upre var isValid; diye defined kore dilam
              //         Navigator.pop(context);
              //       } else {
              //         print("something worng");
              //       }
              //     }
              //     )
            ]),
      ),
    );
  }
}