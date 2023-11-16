import 'package:chatooo/screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'screens/chat_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore_for_file: prefer_const_constructors

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.max,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: Colors.pink,
          secondary: Colors.purple,
        )

      ),
       home:StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),builder: (ctx, userSnapShot) {
        if(userSnapShot.hasData) {
          return ChatScreen();
        } else {
          return AuthScreen();
        }
      } , )
    );
  }
}
