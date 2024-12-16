import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("Assets.images.logo.path"),
          height: 300.h,
          width: 300.w,
        ),
      ),
    );
  }
}
