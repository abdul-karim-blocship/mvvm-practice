import 'dart:convert';

import 'package:flutter/material.dart';
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
    AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);
    return Form(
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
            SizedBox(height: height*.02,),
            CustomTextField(
                validator: (str) {
                  if (str == null) {
                    return 'Email cannot be empty';
                  }
                  if (!str.contains('@')) {
                    return 'Please Enter Valid Email';
                  }
                  return null;
                },
                readOnly: false,
                controller: emailController,
                hintText: 'Email',
                onFieldSubmitted: (v) {
                 FocusScope.of(context).nextFocus();},
                enabled: true),
            SizedBox(
              height: height * .02,
            ),
            CustomPasswordTextField(
                validator: (str) {
                  if (str == null) {
                    return 'Password cannot be empty';
                  }
                  if (str.length < 6) {
                    return 'Min. length for a password is 6 characters';
                  }
                  return null;
                },
                controller: passController,
                hintText: 'Password',
                isPasswordField: true),
            SizedBox(
              height: height * .05,
            ),
            SizedBox(
                height: height * .04,
                width: width * .5,
                child: authViewModel.loading ? const Center(child: CircularProgressIndicator(),) : CustomFilledButton(title: 'Login', onTap: () async {
                  if(formKey.currentState!.validate()){
                    authViewModel.setLoading(true);
                    Map data ={
                      'email': emailController.text,
                      'password': passController.text
                    };
                   String? a = await authViewModel.loginUser(data);
                   if(a.contains('error')){
                     Map b = jsonDecode(a);
                     ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(b['error']));
                   }
                   else {
                     print(a);
                     Navigator.pushReplacementNamed(context, RouteNames.home);
                   }
                    authViewModel.setLoading(false);
                  }
                }))
          ],
        ),
      )),
    );
  }
}
