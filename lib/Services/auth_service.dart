import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  //static get password => null;
//Rgistration part
  static Future<bool> signup(String name, String email, String Password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password:
              Password); // password er error er jonno upore static get password => null; add kora hoiche

      User? signedInUser = authResult.user; //User er pore ? add kora

      if (signedInUser != null) {
        _firestore
            .collection("users")
            .doc(signedInUser.uid)
            .set({
              "name": name, 
              "email": email, 
              "profilePicture": "",
              "coverImage":"",
              "bio":""
              });
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
//Login part

  static Future<bool> Login(String email, String Password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: Password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
