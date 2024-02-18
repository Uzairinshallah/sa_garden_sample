import 'package:flutter/material.dart';
import 'package:sa_garden_sample/model/get_units.dart';
import 'package:sa_garden_sample/provider/auth_provider.dart';
import 'package:sa_garden_sample/provider/get_unit_provider.dart';
import 'package:sa_garden_sample/res/functions/constant.dart';
import 'package:sa_garden_sample/views/widgets/custom_widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../model/unit_details.dart';
import '../../provider/unit_details_provider.dart';
class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AuthProvider authPro;
  late GetUnitProvider getUnitPro;

  GetUnits? unitDetails;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<GetUnitProvider>(context, listen: false).getUnits(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    authPro = Provider.of<AuthProvider>(context);
    getUnitPro = Provider.of<GetUnitProvider>(context);
    unitDetails = getUnitPro.getUnitsList.first;
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
            getText("Full Name :", unitDetails?.name ?? ""),
            getText("Email :", unitDetails?.email  ?? ""),
            getText("Phone :", unitDetails?.mobile1 ?? ""),
            getText("CNIC :",  unitDetails?.cNICNICOP  ?? ""),
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
