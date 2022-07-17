import 'package:flutter/material.dart';

import '../components/home/header.dart';
import '../components/home/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Header(),
                Menu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
