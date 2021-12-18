import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_me/provider/category.dart';
import 'package:quiz_me/screens/welcome_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => CategoryProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}
