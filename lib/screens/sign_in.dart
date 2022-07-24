import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth.controller.dart';
import '../models/request/login_request.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final authController = Get.put(AuthController());
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/image1.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 270),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 23, bottom: 23, top: 5, right: 23),
              child: ListView(
                children: <Widget>[
                  const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Obx(() {
                    if (authController.error.value) {
                      return Center(
                        child: Text(
                          authController.message.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return Container();
                  }),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Container(
                      color: const Color(0xfff5f5f5),
                      child: TextFormField(
                        controller: usernameController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.person_outline),
                            labelStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                  Container(
                    color: const Color(0xfff5f5f5),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          var data = LoginRequest(
                              username: usernameController.text,
                              password: passwordController.text);
                          await authController.handleLogin(data);
                        } catch (_) {}
                      },
                      color: const Color(0xffff2d55),
                      elevation: 0,
                      minWidth: 400,
                      height: 50,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ), //since this is only a UI app
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
