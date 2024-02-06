import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import '../repositories/api_services.dart';
import '../views/homepage/homepage.dart';

class AuthProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  UserModel? userModel;
  void login(BuildContext context, String email, String password) async {

    try{
      Map body = {
        "email": email,
        "password": password,
      };
      var url = "login1";
      var response = await apiService.post(body: body, url: url);
      if(response?.statusCode == 200){

        var jsonResponse = json.decode(response!.body);
        List<UserModel> user = List.generate(
          jsonResponse.length,
              (index) => UserModel.fromJson(
            jsonResponse[index],
          ),
        );
        userModel = user.first;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', userModel!.token);


        Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),),);
      }else{
        print("Something went wrong");
      }
    }
    catch(e){
      debugPrint('Error: $e');

    }

  }
  Future<String> register({
    required String firstName,
    required String lastName,
    required String mobileNumber,
    required String email,
    required String cnic,
    required String password,
    required bool privacyPolicy,
  }) async {
    final url = Uri.parse('http://authapis.nativeprogrammers.com/api/register');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'first_name': firstName,
          'last_name': lastName,
          'mobile_number': mobileNumber,
          'email': email,
          'cnic': cnic,
          'password': password,
          'privacy_policy': privacyPolicy,
        }),
      );

      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        debugPrint('Response message: ${data['message']}');
        return data['message'];
      } else {
        // Handle different status codes
        return 'Error: Server responded with status code: ${response.statusCode}';
      }
    } catch (e) {
      debugPrint('Error: $e');
      return 'Error: Failed to register due to an exception';
    }
  }

  Future<bool> verifyOTP({required String email, required String otp}) async {
    final url = Uri.parse('http://authapis.nativeprogrammers.com/api/verify-otp'); // Replace with your actual URL
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'otp': otp,
      }),
    );
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData['message']== "done";
    } else {
      // Handle errors or other status codes
      throw Exception('OTP verification failed');
    }
  }

// Add more methods as needed...
}
