// ignore_for_file: constant_identifier_names

// const String url = String.fromEnvironment("BASE_URL");
const String url = "https://jackelieson.softvencefsd.xyz/api";
const String imageUrl = "https://jackelieson.softvencefsd.xyz";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

// final class PaymentGateway {
//   PaymentGateway._();
//   static String gateway(String orderId) =>
//       "https://demo.vivapayments.com/web/checkout?ref={$orderId}";
// }

final class Endpoints {
  Endpoints._();
  //backend_url
  static String createAccount() => "/users/register";
  static String otpVerify() => "/users/register/otp-verify";
  static String resendOtp() => "/users/register/otp-resend";
  static String login() => "/users/login";
  static String forgotPassEmail() => "/users/login/email-verify";
  static String forgotPassOtp() => "/users/login/otp-verify";
  static String forgotPassOtpResend() => "/users/login/otp-resend";
  static String forgotPass() => "/users/login/reset-password";
  static String logout() => "/users/logout";
  static String getProfile() => "/users/data";
  static String updateProfile() => "/users/data/update";
  static String changePass() => "/users/change/password";
  static String setProfle() => "/users/set-profile";
  static String getAllHabbit() => "/habit/all";
  static String getAllTask({required String month}) => "/task/all?month=$month";
  static String editTask({required dynamic id}) => "/task/edit/$id";
  static String deleteTask({required dynamic id}) => "/task/delete/$id";
  static String createTask() => "/task/create";
  static String getHabbit({required String day}) => "/my/habits/all?day=$day";
  static String habbitDetails({required dynamic id}) => "/my/habit/single/$id";
  static String createHabbit() => "/user/habits/assign";
  static String createEvent() => "/event/create";
  // static String completeOrincompleteHabbit() =>
  //     "/my/habits/complete/status/complete/4";
  static String getEvent() => "/event/all";
  static String habbitStatus({required String status, required dynamic id}) =>
      "/my/habits/complete/status/$status/$id";

  static String habbitHistory({required dynamic id}) => "/my/habit/history/$id";
}
