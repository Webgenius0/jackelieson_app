import 'package:auto_animated/auto_animated.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jackelieson/helper/all_routes.dart';
import 'package:jackelieson/helper/di.dart';
import 'package:jackelieson/helper/helpers_method.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/register_provider.dart';
import 'package:jackelieson/loading.dart';
import 'package:provider/provider.dart';

import 'networks/dio/dio.dart';

Future<void> backgroundHandler(RemoteMessage message) async {}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  diSetUp();
  initiInternetChecker();
  DioSingleton.instance.create();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // LocalNotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();
    return MultiProvider(
      providers: providers,
      child: AnimateIfVisibleWrapper(
        showItemInterval: const Duration(milliseconds: 150),
        child: PopScope(
          canPop: false,
          // ignore: deprecated_member_use
          onPopInvoked: (bool didPop) async {
            showMaterialDialog(context);
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return const UtillScreenMobile();
            },
          ),
        ),
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return PopScope(
          canPop: false,
          // ignore: deprecated_member_use
          onPopInvoked: (bool didPop) async {
            showMaterialDialog(context);
          },
          child: GetMaterialApp(
            showPerformanceOverlay: false,
            // theme: ThemeData(
            //   primarySwatch: CustomTheme.kToDark,
            //   useMaterial3: false,
            // ),
            // theme: theme.isDarkMode ? dark : light,
            debugShowCheckedModeBanner: false,

            builder: (context, widget) {
              return MediaQuery(data: MediaQuery.of(context), child: widget!);
            },
            navigatorKey: NavigationService.navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            home: Loading(),
          ),
        );
      },
    );
  }
}
