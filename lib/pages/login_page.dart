// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_android_app/utils/routers.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool flag = false;
  final _formKey = GlobalKey<FormState>();

  handleLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        flag = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRouters.homeRoute);
      setState(() {
        flag = false;
        _formKey.currentState?.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          controller: ScrollController(keepScrollOffset: false),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                "assets/images/login_banner.png",
                fit: BoxFit.fill,
                width: 120,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.deepOrange,
                      decoration: const InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username cannot be empty!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password cannot be empty!";
                        } else if (value.length < 6) {
                          return "password should be a least 6 characters!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () => handleLogin(context),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(100, 40),
                      ),
                      child: flag
                          ? Image.asset(
                              "assets/images/loading.gif",
                              width: 30,
                            )
                          : const Text("Login"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
