import 'package:flutter/cupertino.dart';
import 'package:mvvm/repos/auth_repo.dart';

class AuthViewModel with ChangeNotifier {
  final myRepo = AuthRepo();
  bool _loading = false;

  get loading => _loading;

  setLoading(value){
    _loading = value;
    notifyListeners();
  }

  Future<String> loginUser(data) async {
    try {
      final result = await myRepo.loginUser(data);
      return result;
    } catch (error) {
      print(error.toString());
      return error.toString();
    }
  }

  Future<String> signupUser(data)async{
    try {
      final result = await myRepo.signUpUser(data);
      return result;
    } catch (error) {
      print(error.toString());
      return error.toString();
    }
  }
}