import 'package:dio/dio.dart';

class CommonDataBase {
  static const String boxName = 'appBox';
  // static const String authBoxName = 'authUser';

  static final Dio appDio = Dio(
    BaseOptions(
      baseUrl: 'https://presentreading-us.backendless.app/api/',
    ),
  );
}
