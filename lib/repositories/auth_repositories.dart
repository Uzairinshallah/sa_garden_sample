// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'api_services.dart';
//
// class LoginRepository {
//   ApiService apiService = ApiService();
//
//   Future<String?> login({required Map body}) async {
//     var url = "TokenAuth/Authenticate";
//     var response = await apiService.post(body: body, url: url);
//     var reponseBody = jsonDecode(response?.body ?? "");
//     var token = reponseBody["result"]["accessToken"] ?? "";
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString("token", token);
//     debugPrint(response?.body.toString());
//     return response?.body;
//   }
// }
