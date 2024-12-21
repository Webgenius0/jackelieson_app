import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/features/settings/presentation/setting/widgets/setting_app_container.dart';
import 'package:jackelieson/features/settings/presentation/setting/widgets/setting_header_widget.dart';
import 'package:jackelieson/features/settings/presentation/setting/widgets/setting_user_container.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            UIHelper.verticalSpace(60.h),
            SettingHeaderDesignWidget(),
            UIHelper.verticalSpace(32.h),
            SettingUserContainer(),
            UIHelper.verticalSpace(32.h),
            SettingAppContainer(),
          ],
        ),
      ),
    );
  }
}
