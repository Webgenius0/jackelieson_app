import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jackelieson/constant/app_constants.dart';
import 'package:jackelieson/features/auth/presentation/login/login_screen.dart';
import 'package:jackelieson/helper/di.dart';
import 'package:jackelieson/helper/helpers_method.dart';
import 'package:jackelieson/navigation_screen.dart';
import 'package:jackelieson/welcome_screen.dart';

import 'networks/dio/dio.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    // AutoAppUpdateUtil.instance.checkAppUpdate();
    await setInitValue();
    // await getAllShopCategoryRXObj.fetchAllShopCategoryData();
    // await getAllShopRXObj.fetchAllShopData();
    // await getSliderRXObj.fetchSliderData();
    // await getAllSubCategoryRXObj.fetchGetAllSubCategoryData();

    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      // await getAllAddressRXObj.fetchAllDeliveryAddressData();
      // getProfileRXObj.fetchProfileData();
      // getCartRXObj.fetchCartData("0.0");
      // LocalNotificationService.getToken();
    }
    log("Current Lodding State : $_isLoading");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    log("Current Lodding State : $_isLoading");

    if (_isLoading) {
      return const WelcomScreen();
    } else {
      // return const WelcomScreen();
      return appData.read(kKeyIsLoggedIn)
          ? const NavigationScreen()
          : const LoginScreen();
    }
  }
}
