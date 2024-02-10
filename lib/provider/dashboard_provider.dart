import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sa_garden_sample/model/propertyCount.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/api_services.dart';
import '../views/auth_screens/login_screen.dart';

class DashboardProvider extends ChangeNotifier{
  DashboardProvider(){}
  ApiService apiService = ApiService();
  bool countLoading = true;

  List<PropertyCount> propertyCount = [];


  Future<void> getPropertyDetails(BuildContext context) async {
    var url = "PropertyCount1";
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token',) ?? "";
      Map body = {
        "CNIC": "12345-1234567-5",
        "Token": token,
      };
      var response = await apiService.post(url: url, body: body);
      var responseBody = jsonDecode(response!.body);
      List items = responseBody ?? [];
      propertyCount = List.generate(
        items.length,
            (index) => PropertyCount.fromJson(
          items[index],
        ),
      );
      countLoading = false;
      notifyListeners();
      if(propertyCount.isEmpty){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', "");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
                (route) => false);
      }
    } catch (e) {
      debugPrint("error: ${e.toString()}");
    }
    notifyListeners();
  }

}