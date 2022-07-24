import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'screens/home.dart';
import 'screens/sign_in.dart';

Future<Widget> initializeScreen() async {
  final box = GetStorage();
  if (box.read('user') != null) {
    return const MyHomePage();
  }
  return const SignIn();
}
