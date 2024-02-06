import 'package:flutter/material.dart';
import 'package:sa_garden_sample/views/auth_screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/functions/constant.dart';
import '../profile/profile_screen.dart';

class GetDrawer extends StatelessWidget {
  const GetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSpace(h: 50),
          const Image(
            image: AssetImage('assets/images/sa_garden.png'),
            fit: BoxFit.contain,
            height: 80,
          ),
          getSpace(h: 50),
          const Text(
            "Menu",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22),
          ),
          getHeading(
            "Overview",
            Icons.dashboard,
            () {
              Navigator.of(context).pop();
            },
          ),
          getHeading(
            "My Properties",
            Icons.home_outlined,
            () {},
          ),
          getHeading(
            "Electricity bills",
            Icons.electric_bolt,
            () {},
          ),
          getHeading(
            "Service Charges",
            Icons.home_repair_service_outlined,
            () {},
          ),
          getHeading(
            "Profile",
            Icons.account_circle_rounded,
            () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),),);
            },
          ),
          getHeading(
            "Log Out",
            Icons.logout,
            () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('token', "");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }

  Widget getHeading(String txt, IconData icon, Function() onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                txt,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
