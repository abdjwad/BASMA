import 'package:basma/Repository/auth_repository/auth_repository.dart';
import 'package:basma/models/api_respons.dart';
import 'package:basma/models/user.dart';
import 'package:basma/screens/homePage/HomePage.dart';
import 'package:basma/screens/loginand%20register/code_verfiy.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController password = TextEditingController();

  late User user;

  var error;
  bool _isLogin = true;
  bool loading = false;

  bool get isLogin => _isLogin;

  void toggleLoginRegister() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  void login() async {
    loading = true;
    ApiResponse apiResponse =
        await AuthRepository.login(email.text, password.text);
    if (apiResponse.error == null) {
      user = apiResponse.data as User;
      AuthRepository.saveUser(user);
      loading = false;
      notifyListeners();
    } else {
      error = apiResponse.error;
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
    notifyListeners();
  }

  void register(context) async {
    loading = true;
    ApiResponse apiResponse =
        await AuthRepository.register(name.text, email.text, password.text);
    if (apiResponse.error == null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => CodeVerfiy()));
      loading = false;
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));

      print(apiResponse.error);
      loading = false;

      notifyListeners();
    }
    notifyListeners();
  }

  void verfiyCode(context) async {
    loading = true;
    ApiResponse apiResponse = await AuthRepository.verfiyCode(code.text);
    if (apiResponse.error == null) {
      user = apiResponse.data as User;
      AuthRepository.saveUser(user);
      loading = false;
      notifyListeners();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
      print(apiResponse.error);
      loading = false;

      notifyListeners();
    }
    notifyListeners();
  }
}
