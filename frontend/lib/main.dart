import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/post_list_screen.dart';
import 'screens/post_detail_screen.dart';
import 'screens/create_post_screen.dart';

final storage = FlutterSecureStorage();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Blog App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/posts': (context) => PostListScreen(),
        '/create': (context) => CreatePostScreen(),
      },
    );
  }
}