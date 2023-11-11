import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/constants.dart';

class AuthController {
  //loginmethod
  Future<UserCredential?> loginMethod({email, password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return userCredential;
  }

  //signup method
  Future<UserCredential?> signUpMethod(email, password) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return userCredential;
  }

  //store data
  storeUserData({name, email, password}) async {
    DocumentReference store =
        firestore.collection(usersCollections).doc(currentUser!.uid);
    store.set({
      "name": name,
      "password": password,
      "email": email,
      "image_url": '',
      "id": currentUser!.uid,
    });
  }
}
