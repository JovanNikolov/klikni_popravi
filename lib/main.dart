import 'package:flutter/material.dart';
import 'package:klikni_popravi/screens/calendar_page.dart';
import 'package:klikni_popravi/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:klikni_popravi/screens/home_partner.dart';
import 'package:klikni_popravi/screens/login.dart';
import 'package:klikni_popravi/screens/messages.dart';
import 'package:klikni_popravi/screens/messages_partner.dart';
import 'package:klikni_popravi/screens/profile.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Calendar',
      initialRoute: '/login',
      routes: {
        '/' : (context) => const Home(),
        '/login' : (context) => const LoginPage(),
        '/profile' : (context) => const Profile(),
        '/partner' : (context) => const HomePartner(),
        '/calendar' : (context) => const CalendarPage(),
        '/messages' : (context) => const Messages(),
        '/messages_partner' : (context) => const MessagesPartner(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
