import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jackelieson/common_widgets/custom_dropdown.dart';
import 'package:jackelieson/common_widgets/exit_button.dart';
import 'package:jackelieson/constant/app_constants.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/auth/presentation/login/login_screen.dart';
import 'package:jackelieson/features/settings/presentation/setting/widgets/setting_list_tile_items.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/di.dart';
import 'package:jackelieson/networks/api_acess.dart';

class SettingAppContainer extends StatelessWidget {
  const SettingAppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(16.sp),
      decoration: ShapeDecoration(
        color: AppColors.cFFFFFF,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50.w,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: AppColors.cDDDDDD,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 14,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          //--------- start -----------
          SettingListTileItems(
            iconPath: Assets.icons.backup,
            label: "Back Up",
            trailingWidget: MyCustomDropdown(
              height: 40.h,
              width: 63.w,
              // selectedValue: 'Eng',
              hinttext: "OFF",
              horizonPadding: 0,
              dropDownValue: const ["OFF", "ON"],
              isImageNull: true,
            ), //,
          ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),

          SettingListTileItems(
            iconPath: Assets.icons.language,
            label: "App Version",
            trailingWidget: Text(
              '9.9.9.9',
              style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                  .copyWith(fontSize: 14.sp, color: AppColors.c686868),
            ), //,
          ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),

          SettingListTileItems(
              iconPath: Assets.icons.share,
              label: "Share App ",
              trailingWidget: SvgPicture.asset(Assets.icons.nextTile) //,
              ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),

          ListTile(
            contentPadding: EdgeInsets.all(8.sp),
            leading: SvgPicture.asset(
              Assets.icons.logout,
              height: 20.h,
              width: 20.h,
            ),
            title: Text(
              "Log out",
              style: TextFontStyle.headline16w500cFEFFFFStyleRoboto.copyWith(
                color: Colors.red,
                fontSize: 14.sp,
              ),
            ),
            trailing: SvgPicture.asset(
              Assets.icons.nextTile,
              color: Colors.red,
            ),
            onTap: () => showLogoutDialog(context),
          ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),
        ],
      ),
    );
  }
}

void showLogoutDialog(
  BuildContext context,
) {
  showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        "Do you want to Log out?",
        textAlign: TextAlign.center,
        // style: TextFontStyle.headline14StyleMontserrat,
      ),
      actions: <Widget>[
        ExitButton(
            name: "No",
            onCallBack: () {
              Navigator.of(context).pop(false);
            },
            height: 30.sp,
            minWidth: .3.sw,
            borderRadius: 30.r,
            color: AppColors.allPrimaryColor,
            textStyle: GoogleFonts.montserrat(
              fontSize: 17.sp,
              color: AppColors.cFFFFFF,
              fontWeight: FontWeight.w700,
            ),
            context: context),
        ExitButton(
            name: "Yes",
            onCallBack: () {
              appData.erase();
              appData.remove(kKeyAccessToken);
              appData.remove(kKeyIsLoggedIn);
              appData.write(kKeyIsLoggedIn, false);
              logoutRxObj.logout();
              Get.offAll(() => const LoginScreen());
            },
            height: 30.sp,
            minWidth: .3.sw,
            borderRadius: 30.r,
            color: AppColors.allPrimaryColor,
            textStyle: GoogleFonts.montserrat(
                fontSize: 17.sp,
                color: AppColors.cFFFFFF,
                fontWeight: FontWeight.w700),
            context: context),
      ],
    ),
  );
}
