import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_garden_sample/model/unit_details.dart';
import 'package:sa_garden_sample/res/functions/constant.dart';
import 'package:sa_garden_sample/views/widgets/custom_widgets/custom_text.dart';
import 'package:sa_garden_sample/views/widgets/custom_widgets/rounded_container.dart';

import '../../provider/unit_details_provider.dart';

class MyProperties extends StatefulWidget {
  const MyProperties({super.key});

  @override
  State<MyProperties> createState() => _MyPropertiesState();
}

class _MyPropertiesState extends State<MyProperties> {
  late UnitDetailsProvider getUnitPro;

  UnitDetails? unitDetails;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<UnitDetailsProvider>(context, listen: false).getUnitDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUnitPro = Provider.of<UnitDetailsProvider>(context);
    unitDetails = getUnitPro.unitDetails;
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Properties Details",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: (getUnitPro.detailsLoading == true)
              ? const CircularProgressIndicator()
              : (unitDetails == null)
                  ? const Center(
                      child: Text("Session Expired"),
                    )
                  : Column(
                      children: [
                        getSpace(h: 20),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            text: "  File Form No.",
                            color: Colors.white,
                          ),
                        ),
                        getSpace(h: 15),
                        RoundContainer(
                          width: double.infinity,
                          radius: 10,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(),
                              const Align(
                                  alignment: Alignment.center,
                                  child: CustomText(
                                    text: "Owner Details",
                                    bold: FontWeight.w700,
                                  )),
                              const Divider(),
                              getSpace(h: 10),
                              getText("Name: ",
                                  "${unitDetails?.owners.name ?? ""}"),
                              getText("Father/Husband Name: ",
                                  "${unitDetails?.owners.fatherHusband ?? ""}"),
                              getText("Phone 1: ",
                                  "${unitDetails?.owners.mobile1 ?? ""}"),
                              getText("Phone 2: ",
                                  "${unitDetails?.owners.mobile2 ?? ""}"),
                              getText("CNIC: ",
                                  unitDetails?.owners.cnicNicop ?? ""),
                              getText("Date of Birth: ",
                                  unitDetails?.owners.dateOfBirth ?? ""),
                              getText("Occupation: ",
                                  unitDetails?.owners.occupation ?? ""),
                              getText("City: ", unitDetails?.owners.city ?? ""),
                              getText("Residential Address: ",
                                  unitDetails?.owners.residentialAddress ?? ""),
                              getText("Postal Address: ",
                                  unitDetails?.owners.postalAddress ?? ""),
                              getText("Ownership Status: ",
                                  unitDetails?.owners.ownershipStatus ?? ""),
                              const Divider(),
                              const Align(
                                  alignment: Alignment.center,
                                  child: CustomText(
                                    text: "Nominee Details",
                                    bold: FontWeight.w700,
                                  )),
                              const Divider(),
                              getText("Nominee Name: ",
                                  unitDetails?.owners.nomineeName ?? ""),
                              getText("Nominee Relation: ",
                                  unitDetails?.owners.nomineeRelation ?? ""),
                              getText("Nominee CNIC: ",
                                  unitDetails?.owners.nomineeCnicNicop ?? ""),
                              getText("Nominee Address: ",
                                  unitDetails?.owners.nomineeAddress ?? ""),
                            ],
                          ),
                        ),
                        getSpace(h: 10),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              getText(
                                  "Plot Size: ", unitDetails?.unit.size ?? ""),
                              const Divider(),
                              getText("Project: ",
                                  unitDetails?.unit.project ?? "SA Garden"),
                              const Divider(),
                              getText("Type: ", unitDetails?.unit.type ?? ""),
                              const Divider(),
                              getText("Block: ", unitDetails?.unit.block ?? ""),
                              const Divider(),
                              getText(
                                  "Payment Amount: ",
                                  unitDetails?.balance.paymentAmount
                                          .toString() ??
                                      ""),
                              const Divider(),
                              getText(
                                  "Total Amount: ",
                                  unitDetails?.balance.totalAmount.toString() ??
                                      ""),
                              const Divider(),
                              getText(
                                  "Received Amount: ",
                                  unitDetails?.balance.receivedAmount
                                          .toString() ??
                                      ""),
                              const Divider(),
                              getText(
                                  "OutSatnding Amount: ",
                                  unitDetails?.balance.outstandingAmount
                                          .toString() ??
                                      ""),
                            ],
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  getText(String txt1, String txt2) {
    return Row(
      children: [
        CustomText(
          text: txt1,
          bold: FontWeight.w700,
        ),
        getSpace(w: 8),
        Expanded(child: CustomText(text: txt2, maxLines: 1)),
      ],
    );
  }
}
