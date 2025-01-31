// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
// import 'home.dart';
// import 'home_partner.dart';
//
// class RedirectScreen extends StatelessWidget {
//   const RedirectScreen({super.key});
//
//   getRole() async {
//     return await AuthService().getRole().then((value) {
//       return value;
//     });
//   }
//
//     @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: checkUserData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         } else if (snapshot.hasError) {
//           return Scaffold(
//             body: Center(child: Text('Error: ${snapshot.error}')),
//           );
//         } else {
//           final redirectPage = snapshot.data as Widget;
//           return redirectPage;
//         }
//       },
//     );
//   }
//
//   Future<Widget> checkUserData() async {
//
//   //   final user = FirebaseAuth.instance.currentUser;
//   //   if (user == null) {
//   //     return const LoginPage();
//   //   }
//   //
//   //   final userDoc = await FirebaseFirestore.instance
//   //       .collection('users')
//   //       .doc(user.uid)
//   //       .get();
//   //
//   //   if (!userDoc.exists) {
//   //     // User data not found, redirect to a setup/profile creation page
//   //     // return RegisterPage(); //TODO
//   //   }
//   //
//     final String role = getRole().toString();
//     if (role == 'customer') {
//       return const Home();
//     } else {
//       return const HomePartner();
//     }
//   }
// }