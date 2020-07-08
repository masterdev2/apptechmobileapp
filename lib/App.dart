
import 'package:apptech/auth/welcomePage.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      // onGenerateRoute: appRoutes.routes,
      home: WelcomePage(), // insta_home.dart from screens package
    );
  }
}
