import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/local/local_storage.dart';
import 'package:mvvm/providers/auth_provider.dart';
import 'package:mvvm/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel {
  final _myRepo = AuthRepo();
  String? validateEmail(String? str) {
    if (str == null) {
      return 'Email cannot be empty';
    }
    if (!str.contains('@')) {
      return 'Please Enter Valid Email';
    }
    return null;
  }

  String? validatePassword(String? str) {
    if (str == null) {
      return 'Password cannot be empty';
    }
    if (str.length < 6) {
      return 'Min. length for a password is 6 characters';
    }
    return null;
  }

  Future<Map<String, dynamic>> loginUser({required String email, required String password, required AuthProvider authProvider})async{
    Map data ={
      'email': email,
      'password': password
    };
    authProvider.setLoading(true);
    Map<String, dynamic> a = await _myRepo.loginUser(data);
      if (a.containsKey('token')) {
      LocalStorage.getInstance().storeToken(a['token']);
    }
    authProvider.setLoading(false);
    return a;
  }
}