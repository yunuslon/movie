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
  static const apiV = 'api/v1/';

  static const signup = '${apiV}auth/signup';
  static const signin = '${apiV}auth/signin';
  static const trendingMovies = '${apiV}movie/trending';
  static const nowPlayingMovies = '${apiV}movie/nowplaying';

}
