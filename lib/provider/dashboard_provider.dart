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
      String cnic = prefs.getString('cnic',) ?? "";
      Map body = {
        "CNIC": cnic,
        "Token": token,
      };
      var response = await apiService.post(url: url, body: body, context: context);
      var responseBody = jsonDecode(response!.body);
      print("object1 ${responseBody}");

      List items = responseBody ?? [];
      countLoading = false;
      notifyListeners();
      propertyCount = List.generate(
        items.length,
            (index) => PropertyCount.fromJson(
          items[index],
        ),
      );

    } catch (e) {
      debugPrint("error: ${e.toString()}");
    }
    notifyListeners();
  }

}