import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sa_garden_sample/model/get_units.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/api_services.dart';

class GetUnitProvider extends ChangeNotifier {
  GetUnitProvider() {
    // getUnits();
  }
  ApiService apiService = ApiService();
  bool countLoading = true;

  List<GetUnits> getUnitsList = [];

  Future<void> getUnits(BuildContext context) async {
    var url = "GetUnits1";
    try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(
          'token',
        ) ??
        "";
    String cnic = prefs.getString('cnic',) ?? "";
    String phone = prefs.getString('phone',) ?? "";

    Map body = {
      "Phone": phone,
      "CNIC": cnic,
      "Token": token,
    };
    debugPrint("responseBody uzzz");
    print(body);

    var response = await apiService.post(url: url, body: body, context: context);
    var responseBody = jsonDecode(response!.body);
    List items = responseBody ?? [];
    debugPrint("responseBody 444");
    debugPrint(items.length.toString());
    getUnitsList = List.generate(
      items.length,
      (index) => GetUnits.fromJson(
        items[index],
      ),
    );
    } catch (e) {
      debugPrint("error: ${e.toString()}");
    }
    countLoading = false;
    notifyListeners();
  }
}
