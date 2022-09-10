import 'package:flutter/material.dart';
import 'package:flutter_twitter_1/screens/LoginScreen.dart';
import 'package:flutter_twitter_1/screens/RegistrationScreen.dart';
import 'package:flutter_twitter_1/widgets/RoundedButton.dart';

class welcomescreen extends StatefulWidget {
  welcomescreen({Key? key}) : super(key: key);

  @override
  State<welcomescreen> createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  "assets/Twitter-logo.png",
                  height: 200,
                  width: 200,
                ),
                Text(
                  "See what's happening in the world right now",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                MaterialButton(
                    elevation: 5,
                    color: Color(0xff00acee),
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'LOG IN', 
                      style: TextStyle(
                        color: Colors.white, fontSize: 20),
                        ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    minWidth: 320,
                    height: 60,
                  ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                    elevation: 5,
                    color: Color(0xff00acee),
                    child: const Text(
                      'Create acount', 
                      style: TextStyle(
                        color: Colors.white, fontSize: 20),),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => RegistrationScreen()),
                      );
                    },
                    minWidth: 320,
                    height: 60,
                  ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
