import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static const String eMail = 'username';
  static const isLogged = 'isLogged';
  static const String role = 'customer';
  static const String address = "";

  SharedPref._instantiate();
  static final SharedPref instance = SharedPref._instantiate();

  Future<bool> setEmail(String? value) async {
    final prefs = await SharedPreferences.getInstance();
    try{
      await prefs.setString(eMail, value!);
      print("Email is set to local storage $value");
      return true;
    } catch (e) {
      print("Error $e");
      return false;
    }
  }

  Future<String?> getEmail() async{
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString(eMail);
    print("Email in shared prefs $email");
    return email;
  }

  Future<bool> setLogged(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    try{
      await prefs.setBool(isLogged, value);
      print("Logged is set to local storage $value");
      return true;
    } catch (e) {
      print("Error $e");
      return false;
    }
  }

  Future<bool?> getLogged() async{
    final prefs = await SharedPreferences.getInstance();
    bool? logged = prefs.getBool(isLogged);
    print("Logged in shared prefs $logged");
    return logged;
  }

  Future<bool> setRole(String value) async{
    final prefs = await SharedPreferences.getInstance();
    try{
      await prefs.setString(role, value!);
      print("Role is set to local storage $value");
      return true;
    } catch (e) {
      print("Error $e");
      return false;
    }
  }

  Future<String?> getRole() async{
    final prefs = await SharedPreferences.getInstance();
    String? responseRole = prefs.getString(role);
    print("Role in shared prefs $responseRole");
    return responseRole;
  }

  Future<bool> setAddress(String? value) async {
    final prefs = await SharedPreferences.getInstance();
    try{
      await prefs.setString(address, value!);
      print("Address is set to local storage $value");
      return true;
    } catch (e) {
      print("Error $e");
      return false;
    }
  }

  Future<String?> getAddress() async{
    final prefs = await SharedPreferences.getInstance();
    String? add = prefs.getString(address);
    print("Address in shared prefs $add");
    return add;
  }
}
