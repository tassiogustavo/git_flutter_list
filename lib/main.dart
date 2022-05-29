import 'package:flutter/material.dart';
import 'package:git_flutter/Screens/home_screen.dart';

void main() {
  runApp(GitFluApp());
}

class GitFluApp extends StatelessWidget {
  const GitFluApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GitFlu",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Git Flutter List"),
          centerTitle: true,
        ),
        body: HomeScreen(),
      ),
    );
  }
}
