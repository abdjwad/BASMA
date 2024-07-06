import 'package:basma/Repository/post_repository/post_repository.dart';
import 'package:basma/models/api_respons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Product.dart';

class PostProvider with ChangeNotifier {
  List posts = [];
  List myposts = [];
  bool loading = true;
  bool like = false;
  int selectCategory=0;
  var error;
   List category=['story', 'activity', 'other'];
  void getAllPosts() async {
    ApiResponse apiResponse = await PostRepository.getAllPosts();
    if (apiResponse.error == null) {
      posts = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      error = apiResponse.error;
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void getMyPosts() async {
    ApiResponse apiResponse = await PostRepository.getUserPosts();
    if (apiResponse.error == null) {
      myposts = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      error = apiResponse.error;
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  deletePost(id,context)async{
    ApiResponse apiResponse = await PostRepository.deletePost(id);
    if (apiResponse.error == null) {
      loading = false;
      Navigator.of(context).pop();
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
      loading = false;
      notifyListeners();
    }
  }
  updatePost(id,cat,context)async{
    ApiResponse apiResponse = await PostRepository.updatePost(id,cat);
    if (apiResponse.error == null) {
      loading = false;
      Navigator.of(context).pop();
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void filter(i) async {
    ApiResponse apiResponse = await PostRepository.filterPost(category[i]);
    if (apiResponse.error == null) {
      posts = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      error = apiResponse.error;
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }

  void likePost(int id) async {
    ApiResponse apiResponse = await PostRepository.likePost(id);
    if (apiResponse.error == null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool("$id", true);
      notifyListeners();
    } else {
      error = apiResponse.error;
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }

  void dislikePost(int id) async {
    ApiResponse apiResponse = await PostRepository.unlikePost(id);
    if (apiResponse.error == null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool("$id", false);
      notifyListeners();
    } else {
      error = apiResponse.error;
      print(apiResponse.error);
      notifyListeners();
    }
  }

  isLike(id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? d = sharedPreferences.getBool("$id");
    if (d == false) {
      return false;
    }
    return true;
  }
}
