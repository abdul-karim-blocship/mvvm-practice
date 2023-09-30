import 'package:flutter/cupertino.dart';
import 'package:mvvm/repos/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  final myRepo = AuthRepo();
  bool _loading = false;
  String _token = '';

  get loading => _loading;


  get token => _token;

  setLoading(value){
    _loading = value;
    print(loading);
    notifyListeners();
  }

  setToken(String val){
    _token = val;
    notifyListeners();
  }
  //
  // Future<String> loginUser(data) async {
  //   setLoading(true);
  //   notifyListeners();
  //   try {
  //     final result = await myRepo.loginUser(data);
  //     setLoading(false);
  //     notifyListeners();
  //     return result;
  //   } catch (error) {
  //     setLoading(false);
  //     notifyListeners();
  //     print(error.toString());
  //     return error.toString();
  //   }
  // }
  //
  // Future<String> signupUser(data)async{
  //   try {
  //     final result = await myRepo.signUpUser(data);
  //     return result;
  //   } catch (error) {
  //     print(error.toString());
  //     return error.toString();
  //   }
  // }
}