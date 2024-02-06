import 'package:flutter/material.dart';
import 'package:sa_garden_sample/provider/auth_provider.dart';
import 'package:sa_garden_sample/res/functions/constant.dart';
import 'package:sa_garden_sample/views/widgets/custom_widgets/custom_text.dart';
import 'package:provider/provider.dart';
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});


  late AuthProvider authPro;
  @override
  Widget build(BuildContext context) {
    authPro = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Profile Details",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            getSpace(h: 10),
            const Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            ),
            getSpace(h: 30),
            const Divider(),
            getSpace(h: 30),
            getText("Full Name :", authPro.userModel?.name ?? ""),
            getText("Email :", authPro.userModel?.email ?? ""),
            getText("Phone :", authPro.userModel?.phone ?? ""),
            getText("CNIC :",  authPro.userModel?.cnic ?? ""),
          ],
        ),
      ),
    );
  }

  getText(String txt1, String txt2){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          CustomText(text: txt1, bold: FontWeight.w700,),
          getSpace(w: 8),
          Expanded(child: CustomText(text: txt2, maxLines: 1)),
        ],
      ),
    );
  }
}
