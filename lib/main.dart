import 'package:custom_uber/AppPages/AppPage-1/Models/Page01.dart';
import 'package:flutter/material.dart';

// import 'AppPages/AppPage-1/Models/BottomNavBar.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // bottomNavigationBar: BottomNavBar(),
        resizeToAvoidBottomInset: false,
        body: Page01(),
        ),
    );
  }
}