// ignore_for_file: constant_identifier_names

// const String url = String.fromEnvironment("BASE_URL");
const String url = "https://jackelieson.softvencefsd.xyz/api";

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
}
