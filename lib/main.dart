import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_theme.dart';
import 'initialize_screen.dart';

void main() async {
  await GetStorage.init();
  Widget screen = await initializeScreen();
  runApp(MyApp(
    screen: screen,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.screen,
  }) : super(key: key);

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
      ),
      home: screen,
    );
  }
}
