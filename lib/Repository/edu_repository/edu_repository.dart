import 'dart:convert';


import 'package:basma/Repository/Url.dart';
import 'package:basma/Repository/auth_repository/auth_repository.dart';
import 'package:basma/models/OrderExp.dart';
import 'package:basma/models/api_respons.dart';
import 'package:basma/models/class_room.dart';
import 'package:basma/models/explanation.dart';
import 'package:basma/models/subject.dart';
import 'package:basma/models/title.dart';
import 'package:http/http.dart' as http;
class EduRepository{
 static Future<ApiResponse> getAllClassRoom() async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.get(Uri.parse(Url.getAllClassRoom), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body)['data'].map((e)=>ClassRoom.fromJson(e)).toList();
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
  //**************************************************************************
 static Future<ApiResponse> getAllSubjectForClass(id) async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.get(Uri.parse(Url.getSubjectForClass+"/$id"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body)['data'].map((e)=>Subject.fromJson(e)).toList();
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
  //*********************************************************************************
 static Future<ApiResponse> getTitleSubjectClass(id) async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.get(Uri.parse(Url.getTitlesForSubjectClass+"/$id"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body)['data'].map((e)=>title.fromJson(e)).toList();
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
  //************************************************************************
 static Future<ApiResponse> getExplanationsByTitle(id) async {
   ApiResponse apiResponse=ApiResponse();
   String token=await AuthRepository.getToken();
   try {
     var res = await http.get(Uri.parse(Url.getExplanationsByTitle+"/$id"), headers: {
       "Accept": "application/json",
       "Authorization": "Bearer " + token
     });
     if (res.statusCode == 200) {
       apiResponse.data=jsonDecode(res.body).map((e)=>Explanation.fromJson(e)).toList();
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
 static Future<ApiResponse> approveorderExplanation(id) async {
   ApiResponse apiResponse=ApiResponse();
   String token=await AuthRepository.getToken();
   try {
     var res = await http.post(Uri.parse(Url.approveorderExplanation+"/$id"), headers: {
       "Accept": "application/json",
       "Authorization": "Bearer " + token
     });
     if (res.statusCode == 200) {
       apiResponse.data=jsonDecode(res.body);
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

 static Future<ApiResponse> getAllOrderExplanations() async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.get(Uri.parse(Url.getAllOrderExplanations), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body).map((e)=>OrderExp.fromJson(e)).toList();
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
  ////////////////////////////////////////////////////////////////////
 static Future<ApiResponse> getUserPendingExplanations() async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.get(Uri.parse(Url.getUserPendingExplanations), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body).map((e)=>Explanation.fromJson(e)).toList();
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
  ///////////////////////////////////////////////////////////////////
 static  Future<ApiResponse> getUserUploadedExplanations() async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.get(Uri.parse(Url.getUserUploadedExplanations), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body).map((e)=>Explanation.fromJson(e)).toList();
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
  ///////////////////////////////////////////////////////////////////
 static  Future<ApiResponse> getUserRejectedExplanations() async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.get(Uri.parse(Url.getUserRejectedExplanations), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body).map((e)=>Explanation.fromJson(e)).toList();
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
  ///////////////////////////////////////////////////////////////////
 static  Future<ApiResponse> getUserApprovedExplanations() async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.get(Uri.parse(Url.getUserApprovedExplanations), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body).map((e)=>Explanation.fromJson(e)).toList();
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
  //////////////////////////////////////////////////////////////////
 static  Future<ApiResponse> saveExplanationUrl(String url,id) async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.post(Uri.parse(Url.saveExplanationUrl+"/$id"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      },body:{
        "url":url,
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body);
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

  /////////////////////////////////////////////////////////////
  static Future<ApiResponse> generateSignature() async {
    ApiResponse apiResponse=ApiResponse();
    String token=await AuthRepository.getToken();
    try {
      var res = await http.get(Uri.parse(Url.generateSignature), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + token
      });
      if (res.statusCode == 200) {
        apiResponse.data=jsonDecode(res.body)['signatureData'];
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





}