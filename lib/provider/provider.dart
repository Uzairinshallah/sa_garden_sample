import 'package:provider/provider.dart';
import 'package:sa_garden_sample/provider/dashboard_provider.dart';
import 'package:sa_garden_sample/provider/get_unit_provider.dart';
import 'package:sa_garden_sample/provider/unit_details_provider.dart';
import 'auth_provider.dart';


dynamic get listOfProvider => [
  ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
  ChangeNotifierProvider<DashboardProvider>(create: (_) => DashboardProvider()),
  ChangeNotifierProvider<UnitDetailsProvider>(create: (_) => UnitDetailsProvider()),
  ChangeNotifierProvider<GetUnitProvider>(create: (_) => GetUnitProvider()),
];