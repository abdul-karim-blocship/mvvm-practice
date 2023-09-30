import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm/providers/auth_provider.dart';
import 'package:mvvm/providers/auth_provider.dart';
import 'package:mvvm/res/Widgets/custom_buttons.dart';
import 'package:mvvm/res/Widgets/snack_bar.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../res/Widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => Form(
        key: formKey,
        child: Scaffold(
            body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineLarge,
                  )),
              SizedBox(
                height: height * .02,
              ),
              CustomTextField(
                  validator: AuthViewModel().validateEmail,
                  readOnly: false,
                  controller: emailController,
                  hintText: 'Email',
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  enabled: true),
              SizedBox(
                height: height * .02,
              ),
              CustomPasswordTextField(
                  validator: AuthViewModel().validatePassword,
                  controller: passController,
                  hintText: 'Password',
                  isPasswordField: true),
              SizedBox(
                height: height * .05,
              ),
              SizedBox(
                  height: height * .04,
                  width: width * .5,
                  child: authProvider.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomFilledButton(
                          title: 'Login',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              Map<String, dynamic> login = await AuthViewModel()
                                  .loginUser(
                                      email: emailController.text,
                                      password: passController.text,
                                      authProvider: authProvider);
                              if (login.containsKey('error')) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    CustomSnackBar(login['error']));
                              } else {
                                print(login);
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.home);
                              }
                            }
                          }))
            ],
          ),
        )),
      ),
    );
  }
}
