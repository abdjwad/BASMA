
import 'dart:convert';
import 'dart:html';
import 'package:basma/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:basma/Repository/Url.dart';
import 'package:basma/models/api_respons.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthRepository{
 static Future<ApiResponse> register(String name,String email,String password) async {

   ApiResponse apiResponse=ApiResponse();

  try {
      var res = await http.post(Uri.parse(Url.register),
          body: {"email": email, "name": name, "password": password});
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body);
      }
      else{
        apiResponse.error=jsonDecode(res.body);
      }
    }catch(e){
    print(e);
  }
  return apiResponse;
  }
 static  Future<ApiResponse> login(String email,String password) async {
    ApiResponse apiResponse=ApiResponse();
    var res= await http.post(Uri.parse(Url.login),body:{
      "email":email,
      "password":password
    });
    if (res.statusCode == 200) {
      apiResponse.data=User.fromJson(jsonDecode(res.body));
    }
    else{
      apiResponse.error=jsonDecode(res.body);
    }
    return apiResponse;
  }
 static Future<ApiResponse> verfiyCode(String code)async{
   ApiResponse apiResponse=ApiResponse();
    var res= await http.post(Uri.parse(Url.verify),body:{
    "code":code
    });
    if (res.statusCode == 200) {
      apiResponse.data=User.fromJson(jsonDecode(res.body));
    }
    else{
      apiResponse.error=jsonDecode(res.body);
    }
   return apiResponse;
  }
 static Future<ApiResponse> resendCode(String email)async{
   ApiResponse apiResponse=ApiResponse();
    var res= await http.post(Uri.parse(Url.resendCode),body:{
      "email":email
    });
    if (res.statusCode == 200) {
      apiResponse.data=jsonDecode(res.body);
    }
    else{
      apiResponse.error=jsonDecode(res.body);
    }
   return apiResponse;
  }
static  getToken()async {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  return sharedPreferences.getString('token');
  }
static  saveUser(User user)async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
sharedPreferences.setString("email", user.email??"");
sharedPreferences.setString("name", user.name??"");
sharedPreferences.setString("token", user.token??"");
  }

}