import 'package:jackelieson/networks/provider/auth_provider.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider<AuthProvider>(create: ((context) => AuthProvider())),
];
