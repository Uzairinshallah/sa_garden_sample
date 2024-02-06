import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sa_garden_sample/model/unit_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/api_services.dart';

class UnitDetailsProvider extends ChangeNotifier {
  UnitDetailsProvider() {
    getUnitDetails();
  }
  ApiService apiService = ApiService();
  bool detailsLoading = true;

  UnitDetails? unitDetails;

  Future<void> getUnitDetails() async {
    var url = "getunitdetail1";
    try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(
          'token',
        ) ??
        "";
    Map body = {
      "id": "17194",
      "Module": "PlotManagement",
      "Token": token,
    };
    debugPrint("responseBody 222");

    var response = await apiService.post(url: url, body: body);
    var responseBody = jsonDecode(response!.body);
    debugPrint("responseBody 2223");

    print(responseBody);
    unitDetails = UnitDetails.fromJson(responseBody);
    detailsLoading = false;

    } catch (e) {
      debugPrint("error: ${e.toString()}");
    }
    notifyListeners();
  }
}
