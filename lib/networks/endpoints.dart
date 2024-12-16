// ignore_for_file: constant_identifier_names

// const String url = String.fromEnvironment("BASE_URL");
const String url = "https://kg5985-express.vercel.app/api/v1";

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
  static String signup() => "/register";
  static String login() => "/login";
  static String createReminder() => "/create-reminder";
  static String homeActive() => "/active-reminders";
  static String homeSnooze() => "/snooze-list";
  static String homeComplete() => "/complete-reminders";
  static String deleteReminder({required dynamic id}) => "/remove-reminder/$id";
  static String homeCreateSnooze({required dynamic id}) => "/create-snooze/$id";
  static String helpAndSupport() => "/create-help";
  // static String createProfile({required dynamic id}) => "/api/profile/$id/";
  // static String logout() => "/api/logout";
}
