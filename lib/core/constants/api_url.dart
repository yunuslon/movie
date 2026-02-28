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
  static const popularTV = '${apiV}tv/popular';
  static const movie = '${apiV}movie/';
  static const tv = '${apiV}tv/';
  static const search = '${apiV}search/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}
