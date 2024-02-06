import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sa_garden_sample/views/homepage/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_screens/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    navigatie();


    var assetsImage = const AssetImage('assets/images/sa_garden.png');
    var image = Image(image: assetsImage, height: 80);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: image,
        ),
      ), //<- place where the image appears
    );
  }

  void navigatie() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token',) ?? "";
    Timer(
        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
            (token.isEmpty) ? LoginScreen() : Homepage())));
  }
}
