import 'dart:io';
class ApiUrl {
  static String get baseURL {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:5001/';
    } else if (Platform.isIOS) {
      return 'http://127.0.0.1:5001/';
    } else {
      return 'http://localhost:5001/';
    }
  }

  static const signup = 'api/v1/auth/signup';
  static const signin = 'api/v1/auth/signin';
}
