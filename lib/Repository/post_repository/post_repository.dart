import 'dart:convert';
import 'dart:io';
import 'package:basma/Repository/Url.dart';
import 'package:basma/Repository/auth_repository/auth_repository.dart';
import 'package:basma/models/api_respons.dart';
import 'package:basma/models/post.dart';
import 'package:http/http.dart' as http;
class PostRepository{
  static Future<ApiResponse> getAllPosts() async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
   try {
      var res = await http.get(Uri.parse(Url.getAllPosts), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body).map((e)=>Post.fromJson(e)).toList();
      }
      else{
        apiResponse.error=jsonDecode(res.body);
      }
    }catch(e){
     apiResponse.error="server error";
     print(e);
   }
   return apiResponse;
  }
  static  Future<ApiResponse> createPost(String text,File image) async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.post(Uri.parse(Url.createPost), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      },body:{
        "text":text,
        "image":image
      });
      if (res.statusCode == 201) {
        apiResponse.data=jsonDecode(res.body)['data'];
      }
      else{
        apiResponse.error=jsonDecode(res.body)['error'];
      }
    }catch(e){
      apiResponse.error="server error";
      print(e);
    }
    return apiResponse;
  }
  static  Future<ApiResponse> updatePost(id,postCategory) async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.post(Uri.parse(Url.createPost+"/$id"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      },body:{
        "post_category":postCategory

      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body)['data'];
      }
      else{
        apiResponse.error=jsonDecode(res.body)['error'];
      }
    }catch(e){
      apiResponse.error="server error";
      print(e);
    }
    return apiResponse;
  }
  static  Future<ApiResponse> deletePost(id) async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.delete(Uri.parse(Url.createPost+"/$id"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body)['message'];
      }
      else{
        apiResponse.error=jsonDecode(res.body)['error'];
      }
    }catch(e){
      apiResponse.error="server error";
      print(e);
    }
    return apiResponse;
  }
  static Future<ApiResponse> filterPost(String postCategory) async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.post(Uri.parse(Url.createPost), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      },body:{
        "post_category":postCategory,

      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body).map((e)=>Post.fromJson(e)).toList();
      }
      else{
        apiResponse.error=jsonDecode(res.body)['error'];
      }
    }catch(e){
      apiResponse.error="server error";
      print(e);
    }
    return apiResponse;
  }
  static  Future<ApiResponse> likePost(id) async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.post(Uri.parse(Url.likePost+'/$id'), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body)['message'];
      }
      else{
        apiResponse.error=jsonDecode(res.body)['error'];
      }
    }catch(e){
      apiResponse.error="server error";
      print(e);
    }
    return apiResponse;
  }
  static  Future<ApiResponse> unlikePost(id) async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.post(Uri.parse(Url.UnlikePost+"/$id"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      },);
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body)['message'];
      }
      else{
        apiResponse.error=jsonDecode(res.body)['error'];
      }
    }catch(e){
      apiResponse.error="server error";
      print(e);
    }
    return apiResponse;
  }
  static Future<ApiResponse> getUserPosts() async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.get(Uri.parse(Url.getUserPost), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      },);
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body).map((e)=>Post.fromJson(e)).toList();
      }
      else{
        apiResponse.error=jsonDecode(res.body)['error'];
      }
    }catch(e){
      apiResponse.error="server error";
      print(e);
    }
    return apiResponse;
  }
}