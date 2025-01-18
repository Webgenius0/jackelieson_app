import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jackelieson/features/auth/presentation/forgot_pass/forgot_pass_email_screen.dart';
import 'package:jackelieson/features/auth/presentation/forgot_pass/forgot_password_screen.dart';
import 'package:jackelieson/features/auth/presentation/forgot_pass/pass_changed_confarmation.dart';
import 'package:jackelieson/features/auth/presentation/forgot_pass/password_change_success_screen.dart';
import 'package:jackelieson/features/auth/presentation/login/login_screen.dart';
import 'package:jackelieson/features/auth/presentation/others/choose_habits_screen.dart';
import 'package:jackelieson/features/auth/presentation/others/upload_profile_pic_screen.dart';
import 'package:jackelieson/features/auth/presentation/signup/create_account_screen.dart';
import 'package:jackelieson/features/auth/presentation/validation/verification_screen.dart';
import 'package:jackelieson/features/habits/habbit_deatils_screen.dart';
import 'package:jackelieson/features/settings/presentation/profile/profile_screen.dart';
import 'package:jackelieson/navigation_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String splashscreen = '/splashscreen';
  static const String createAccountScreen = '/create_account_screen';
  static const String loginScreen = '/login_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String forgotPasswordEmailScreen =
      '/forgot_password__email_screen';
  static const String passwordChangeSuccessScreen =
      '/password_change_success_screen';
  static const String verificationScreen = '/verification_screen';
  static const String uploadProfilePicScreen = '/upload_profile_pic_screen';
  static const String chooseHabitsScreen = '/choose_habits_screen';
  static const String passChangedConfarmation = '/passChangedConfarmation';
  static const String navigation = '/navigation';
  static const String profileUpdate = '/profileUpdate';
  static const String habbitDetails = '/habbitDetails';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
// ============================= Authentication ========================================

      case Routes.loginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: LoginScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const LoginScreen(),
              );

      case Routes.forgotPasswordScreen:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: ForgotPasswordScreen(
                  email: args["email"],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => ForgotPasswordScreen(
                  email: args["email"],
                ),
              );

      case Routes.forgotPasswordEmailScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ForgotPasswordEmailScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ForgotPasswordEmailScreen(),
              );

      case Routes.passwordChangeSuccessScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget:
                    const ScreenTitle(widget: PasswordChangeSuccessScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const PasswordChangeSuccessScreen(),
              );

      case Routes.createAccountScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(
                  widget: CreateAccountScreen(),
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const CreateAccountScreen(),
              );

      case Routes.verificationScreen:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                  widget: VerificationScreen(
                    email: args["email"],
                    isSignup: args["isSignup"],
                  ),
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => VerificationScreen(
                  email: args["email"],
                  isSignup: args["isSignup"],
                ),
              );

      case Routes.uploadProfilePicScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(
                  widget: UploadProfilePicScreen(),
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const UploadProfilePicScreen(),
              );

      case Routes.chooseHabitsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(
                  widget: ChooseHabitsScreen(),
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ChooseHabitsScreen(),
              );

      case Routes.passChangedConfarmation:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(
                  widget: PassChangedConfarmation(),
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const PassChangedConfarmation(),
              );
      //================================= Navigation Screens ====================================
      case Routes.navigation:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(
                  widget: NavigationScreen(),
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const NavigationScreen(),
              );

      case Routes.profileUpdate:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(
                  widget: ProfileScreen(),
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ProfileScreen(),
              );

      case Routes.habbitDetails:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(
                  widget: HabbitDeatilsScreen(),
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const HabbitDeatilsScreen(),
              );

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
