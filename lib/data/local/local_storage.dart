import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static LocalStorage? _instance;
  SharedPreferences? sharedPrefs;

  // Private constructor to prevent direct instantiation
  LocalStorage._();

  // Singleton pattern to ensure only one instance is created
  static LocalStorage getInstance() {
    _instance ??= LocalStorage._();
    return _instance!;
  }

  Future<void> init() async {
    print('init');
    sharedPrefs = await SharedPreferences.getInstance();
  }

  void storeToken(String value) {
    sharedPrefs!.setString('token', value);
  }
}
