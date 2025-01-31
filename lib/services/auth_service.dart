import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klikni_popravi/screens/home_partner.dart';
import 'package:klikni_popravi/services/shared_pref.dart';
import '../screens/home.dart';
import '../screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthService{
  final SharedPref _sharedPref = SharedPref.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> register(String email, String password, String role, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      _sharedPref.setEmail(email);
      // String uid = userCredential.user!.uid;
      //
      // await _firestore.collection('users').doc(uid).set({
      //   'uid': uid,
      //   'email': email,
      //   'role': role,
      //   'createdAt': FieldValue.serverTimestamp(),
      // });
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginPage()));
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login(String email, String password,String role, BuildContext context) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      _sharedPref.setEmail(email);
      _sharedPref.setRole(role);
      await _sharedPref.getLogged() == false ? _sharedPref.setLogged(true) : null;
      if(role == "customer"){
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => Home()));
        });
      }else{
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => HomePartner()));
        });
      }
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return 'Invalid login credentials.';
      } else {
        return e.message;
      }
    }
    catch (e) {
      return e.toString();
    }
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) {
      _sharedPref.setLogged(false);
      _sharedPref.setEmail(null);
    });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }

  Future<String?> getEmail() async {
    String? email;
    try {
      email = await _sharedPref.getEmail();
      return email;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      return e.message.toString();
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future<String?> getRole() async {
    String? role;
    try {
      role = await _sharedPref.getRole();
      return role;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      return e.message.toString();
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
