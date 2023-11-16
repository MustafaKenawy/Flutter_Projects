// ignore_for_file: prefer_const_constructors

import 'package:coursito/screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'courses.dart';
import 'package:provider/provider.dart';
import 'providers/course.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return Courses();
          }),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.light()
                  .copyWith(primary: Colors.pink, secondary: Colors.pink),
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx, userSnapShot) {
                if (userSnapShot.hasData) {
                  return MainScreensControl();
                } else {
                  return AuthScreen();
                }
              },
            )));
  }
}

class MainScreensControl extends StatefulWidget {
  @override
  State<MainScreensControl> createState() => _MainScreensControlState();
}

class _MainScreensControlState extends State<MainScreensControl> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.logout_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                ))
          ],
          backgroundColor: Colors.black,
          leading: Icon(
            Icons.school_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            'Coursito',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.secondary,
            indicatorColor:
                Colors.pinkAccent, // Theme.of(context).colorScheme.secondary,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.home,
                ),
                text: 'Home',
              ),
              Tab(
                icon: Icon(
                  Icons.school_rounded,
                ),
                text: 'My Courses',
              ),
              Tab(
                icon: Icon(
                  Icons.settings,
                ),
                text: 'Settings',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: const [
            CoursesScreen(),
            CoursesScreen(),
            CoursesScreen(),
          ],
        ),
      ),
    );
  }
}
