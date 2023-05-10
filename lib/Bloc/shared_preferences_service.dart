import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future createCache(String emailController) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("emailController", emailController);
  }

  Future readCache(String emailController) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString("emailController");
    return cache;
  }

  Future removeCache(String emailController) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("emailController");
  }
}
