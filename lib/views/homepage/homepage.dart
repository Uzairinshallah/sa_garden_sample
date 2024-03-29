import 'package:flutter/material.dart';
import 'package:sa_garden_sample/provider/dashboard_provider.dart';
import 'package:sa_garden_sample/provider/unit_details_provider.dart';
import 'package:sa_garden_sample/views/widgets/get_drawer.dart';
import 'package:provider/provider.dart';

import '../../provider/get_unit_provider.dart';
import '../../res/functions/constant.dart';
import '../my_properties/my_properties.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<IconData> iconList = [
    Icons.file_copy,
    Icons.home,
    Icons.account_balance_outlined,
    Icons.home_outlined,
    Icons.shopping_bag_outlined,
  ];

  DashboardProvider? dashboardPro;
  GetUnitProvider? getUnitPro;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    if(isLoad == false){
      getUnitPro = Provider.of<GetUnitProvider>(context,)
        ..getUnits(context);
      dashboardPro ??= Provider.of<DashboardProvider>(context,)
        ..getPropertyDetails(context);
      isLoad = true;
    }
    return Scaffold(
        key: _key,
        drawer: const GetDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                  height: 200,
                  color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                _key.currentState!.openDrawer();
                                // _key.currentState.openDrawer(),
                              },
                              child: const Icon(
                                Icons.line_weight_sharp,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Customer Portal",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.account_circle_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "SA \n System",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Row(
                children: [
                  getSpace(w: 16),
                  const Icon(
                    Icons.dashboard,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "My Dashboard",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              (dashboardPro!.countLoading == true)
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.red,
                    ))
                  : GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1, // Adjust as needed
                      ),
                      itemCount: dashboardPro!.propertyCount.length,
                      itemBuilder: (context, index) {
                        var pCount = dashboardPro!.propertyCount[index];
                        return getBox(pCount.type, iconList[index],
                            pCount.total, context);
                      },
                    ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 35,
              ),
              (getUnitPro!.getUnitsList.isNotEmpty) ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: getBox2(
                          "Name", Icons.drive_file_rename_outline, context),
                    ),
                    DataColumn(
                      label: getBox2("Mobile", Icons.mobile_friendly, context),
                    ),
                    DataColumn(
                      label: getBox2("CNIC", Icons.mobile_friendly, context),
                    ),
                    DataColumn(
                      label: getBox2("Plots", Icons.home_outlined, context),
                    ),
                    DataColumn(
                      label: getBox2("Types", Icons.type_specimen, context),
                    ),
                    DataColumn(
                      label:
                          getBox2("Status", Icons.ev_station_rounded, context),
                    ),
                    DataColumn(
                      label: getBox2(
                          "Actions", Icons.call_to_action_outlined, context),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(cells: <DataCell>[
                      for (var key in getUnitPro!.getUnitsList) ...[
                        DataCell(Text(key.name.toString())),
                        DataCell(Text(key.mobile1.toString())),
                        DataCell(Text(key.cNICNICOP.toString())),
                        DataCell(Text(key.plotSize.toString())),
                        DataCell(Text(key.type.toString())),
                        DataCell(Text(key.status.toString())),
                        DataCell(
                          SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                getButton("Details", Colors.red, () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyProperties(id: key.unitId.toString(), module: key.module!),
                                      ));
                                }),
                                getSpace(h: 5),
                                getButton(
                                    "Pay Installment", Colors.blue, () {}),
                              ],
                            ),
                          ),
                        ),
                      ]
                    ])
                  ],
                ),
              ) : SizedBox(),
            ],
          ),
        ));
  }

  Widget getButton(String txt, Color col, Function() onTap) {
    return SizedBox(
      height: 20,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(col),
        ),
        onPressed: () {
          onTap();
        },
        child: Text(
          txt,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Container getBox(String txt, IconData icon, int count, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      width: MediaQuery.of(context).size.width * .4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 45,
              ),
              getSpace(h: 5),
              Text(
                txt,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            count.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget getBox2(String txt, IconData icon, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            getSpace(w: 8),
            Text(
              txt,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
