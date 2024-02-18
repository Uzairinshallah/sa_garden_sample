import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../views/auth_screens/login_screen.dart';

class ApiService {
  static const String _apiUrl = "http://43.251.252.207:8000/customerportal/";

  Future<http.Response?> post({required String url, required Map body, required BuildContext context}) async {
    http.Response responseJson;

    try {
      responseJson = await http
          .post(Uri.parse("$_apiUrl$url"), body: jsonEncode(body), headers: {
        "Content-Type": "application/json",
      });
      debugPrint("request body : ${body.toString()}");
      print("responseJson.statusCode : ${responseJson.statusCode}");
      print("3 ${responseJson.statusCode}");
      debugPrint("2 ${responseJson.body.toString()}");
      debugPrint("1 ${responseJson.statusCode.toString()}");
      if (responseJson.statusCode != 200) {
        throw Exception("Something went wrong");
      }
    } on SocketException {
      throw const SocketException('No Internet Connection');
    }
    if(jsonDecode(responseJson.body) == false){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', "");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
                (route) => false);
    }
    return responseJson;
  }

  Future<http.Response?> authPost(
      {required String url, required Map body}) async {
    http.Response responseJson;

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token") ?? "";
      responseJson = await http
          .post(Uri.parse("$_apiUrl$url"), body: jsonEncode(body), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
        // "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjQiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6IjllZGY0MDhjLTgwODUtY2JkNy05ZjUzLTNhMDhmYWVjNmY2MCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlNlZWtlciIsImh0dHA6Ly93d3cuYXNwbmV0Ym9pbGVycGxhdGUuY29tL2lkZW50aXR5L2NsYWltcy90ZW5hbnRJZCI6IjEiLCJzdWIiOiI0IiwianRpIjoiOTBhYTQyMmYtYzViMy00MDU3LWE4MzktMmE5NDhkMjc5YTgxIiwiaWF0IjoxNjc0ODQyNDA3LCJ0b2tlbl92YWxpZGl0eV9rZXkiOiIwM2IyY2UxMS1kYzAwLTQ2ZTUtYjI2Zi0yZDU1ZmExMGFkMjUiLCJ1c2VyX2lkZW50aWZpZXIiOiI0QDEiLCJ0b2tlbl90eXBlIjoiMCIsIm5iZiI6MTY3NDg0MjQwNywiZXhwIjoxNjc0OTI4ODA3LCJpc3MiOiJCZXlmaWthciIsImF1ZCI6IkJleWZpa2FyIn0.mVFD5WLfCgSh-t0WCQ4VyqyUaVbSR0K_YpTJGLc3its"
      });
      debugPrint("request body : ${body.toString()}");
      debugPrint(responseJson.body.toString());
      debugPrint(responseJson.statusCode.toString());
      if (responseJson.statusCode != 200) {
        throw Exception("Something went wrong");
      }
    } on SocketException {
      throw const SocketException('No Internet Connection');
    }
    return responseJson;
  }

  Future<http.Response?> authGet({required String url}) async {
    http.Response responseJson;
    final prefs = await SharedPreferences.getInstance();
    debugPrint("$_apiUrl$url");
    final token = prefs.getString("token") ?? "";
    try {
      responseJson = await http.get(Uri.parse("$_apiUrl$url"),
          // body: jsonEncode(body),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
            // "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjQiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6IjllZGY0MDhjLTgwODUtY2JkNy05ZjUzLTNhMDhmYWVjNmY2MCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlNlZWtlciIsImh0dHA6Ly93d3cuYXNwbmV0Ym9pbGVycGxhdGUuY29tL2lkZW50aXR5L2NsYWltcy90ZW5hbnRJZCI6IjEiLCJzdWIiOiI0IiwianRpIjoiOTBhYTQyMmYtYzViMy00MDU3LWE4MzktMmE5NDhkMjc5YTgxIiwiaWF0IjoxNjc0ODQyNDA3LCJ0b2tlbl92YWxpZGl0eV9rZXkiOiIwM2IyY2UxMS1kYzAwLTQ2ZTUtYjI2Zi0yZDU1ZmExMGFkMjUiLCJ1c2VyX2lkZW50aWZpZXIiOiI0QDEiLCJ0b2tlbl90eXBlIjoiMCIsIm5iZiI6MTY3NDg0MjQwNywiZXhwIjoxNjc0OTI4ODA3LCJpc3MiOiJCZXlmaWthciIsImF1ZCI6IkJleWZpa2FyIn0.mVFD5WLfCgSh-t0WCQ4VyqyUaVbSR0K_YpTJGLc3its"
          });
      debugPrint(responseJson.body.toString());
      debugPrint(responseJson.statusCode.toString());
      if (responseJson.statusCode != 200) {
        throw Exception("Something went wrong");
      }
    } on SocketException {
      prefs.setString('token', "");
      throw const SocketException('No Internet Connection');
    }
    return responseJson;
  }

  Future<http.Response?> authPut(
      {required String url, required Map body}) async {
    http.Response responseJson;

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token") ?? "";
      responseJson = await http
          .put(Uri.parse("$_apiUrl$url"), body: jsonEncode(body), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
        // "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjQiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6IjllZGY0MDhjLTgwODUtY2JkNy05ZjUzLTNhMDhmYWVjNmY2MCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlNlZWtlciIsImh0dHA6Ly93d3cuYXNwbmV0Ym9pbGVycGxhdGUuY29tL2lkZW50aXR5L2NsYWltcy90ZW5hbnRJZCI6IjEiLCJzdWIiOiI0IiwianRpIjoiOTBhYTQyMmYtYzViMy00MDU3LWE4MzktMmE5NDhkMjc5YTgxIiwiaWF0IjoxNjc0ODQyNDA3LCJ0b2tlbl92YWxpZGl0eV9rZXkiOiIwM2IyY2UxMS1kYzAwLTQ2ZTUtYjI2Zi0yZDU1ZmExMGFkMjUiLCJ1c2VyX2lkZW50aWZpZXIiOiI0QDEiLCJ0b2tlbl90eXBlIjoiMCIsIm5iZiI6MTY3NDg0MjQwNywiZXhwIjoxNjc0OTI4ODA3LCJpc3MiOiJCZXlmaWthciIsImF1ZCI6IkJleWZpa2FyIn0.mVFD5WLfCgSh-t0WCQ4VyqyUaVbSR0K_YpTJGLc3its"
      });
      debugPrint("request body : ${body.toString()}");
      debugPrint(responseJson.body.toString());
      debugPrint(responseJson.statusCode.toString());
      if (responseJson.statusCode != 200) {
        throw Exception("Something went wrong");
      }
    } on SocketException {
      throw const SocketException('No Internet Connection');
    }
    return responseJson;
  }
}
