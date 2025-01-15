import 'package:jackelieson/provider/auth_provider.dart';
import 'package:jackelieson/provider/calendar_provider.dart';
import 'package:jackelieson/provider/habbit_provider.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider<AuthProvider>(create: ((context) => AuthProvider())),
  ChangeNotifierProvider<CalendarProvider>(
      create: ((context) => CalendarProvider())),
  ChangeNotifierProvider<EventController>(
      create: ((context) => EventController())),
  ChangeNotifierProvider<Calendar>(create: ((context) => Calendar())),
];
