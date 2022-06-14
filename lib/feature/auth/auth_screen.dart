// ignore_for_file: unused_import, constant_identifier_names, unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, must_be_immutable

import 'package:amzon_clone/common/Widgets/customTextField.dart';
import 'package:amzon_clone/common/Widgets/custom_button.dart';
import 'package:amzon_clone/constants/global_var.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String RouteName = '/auth-screen';
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            ListTile(
              tileColor: auth == Auth.signup
                  ? GlobalVariable.backgroundColor
                  : GlobalVariable.greyBackgroundCOlor,
              title: Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariable.secondaryColor,
                onChanged: (Auth? val) {
                  setState(() {
                    auth = val!;
                  });
                },
                value: Auth.signup,
                groupValue: auth,
              ),
            ),
            if (auth == Auth.signup)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: GlobalVariable.backgroundColor,
                ),
                padding: EdgeInsets.all(8),
                /*  color: GlobalVariable.backgroundColor, */
                child: Form(
                  key: _signUpFormKey,
                  child: Column(children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Name',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Email(optional)',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Set password',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(text: 'SignUp', onTap: () {})
                  ]),
                ),
              ),
            ListTile(
              title: Text(
                "Sign-In",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariable.secondaryColor,
                onChanged: (Auth? val) {
                  setState(() {
                    auth = val!;
                  });
                },
                value: Auth.signin,
                groupValue: auth,
              ),
            )
          ],
        ),
      )),
    );
  }
}
