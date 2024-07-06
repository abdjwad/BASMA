import 'package:basma/Repository/edu_repository/edu_repository.dart';
import 'package:basma/Repository/post_repository/post_repository.dart';
import 'package:basma/models/api_respons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Product.dart';

class EduProvider with ChangeNotifier {
  List classRoom = [];
  List subject = [];
  List title = [];
  List orderExp = [];
  List ExpBytitle=[];
  List ExpforOrder=[];
  List MyExp = [];

  bool loading = true;
  bool like = false;

  void getAllClassRoom() async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await EduRepository.getAllClassRoom();
    if (apiResponse.error == null) {
      classRoom = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void getAllSubject(id) async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await EduRepository.getAllSubjectForClass(id);
    if (apiResponse.error == null) {
      subject = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void getAllTitle(id) async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await EduRepository.getTitleSubjectClass(id);
    if (apiResponse.error == null) {
      title = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void getAllOrderExplanations() async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await EduRepository.getAllOrderExplanations();
    if (apiResponse.error == null) {
      orderExp = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void getExplanationsByTitle(id) async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await EduRepository.getExplanationsByTitle(id);
    if (apiResponse.error == null) {
      ExpBytitle = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void getExplanationsforOder(id) async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await EduRepository.approveorderExplanation(id);
    if (apiResponse.error == null) {
      ExpforOrder = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void getPindingExplanationsforOder() async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await EduRepository.getUserPendingExplanations();
    if (apiResponse.error == null) {
      MyExp = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void getAprovedExplanationsforOder() async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await EduRepository.getUserApprovedExplanations();
    if (apiResponse.error == null) {
      MyExp = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void getUploadedExplanationsforOder() async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await EduRepository.getUserUploadedExplanations();
    if (apiResponse.error == null) {
      MyExp = apiResponse.data as List;
      loading = false;
      notifyListeners();
    } else {
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }
  void createExplanationsforOder(id) async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await EduRepository.approveorderExplanation(id);
    if (apiResponse.error == null) {
      print("success create");
      loading = false;
      notifyListeners();
    } else {
      print(apiResponse.error);
      loading = false;
      notifyListeners();
    }
  }

}
