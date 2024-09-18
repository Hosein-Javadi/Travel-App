import 'package:aspen_explore_application/data/common/common.dart';
import 'package:backendless_sdk/backendless_sdk.dart';

import 'package:dio/dio.dart';

import 'package:get_storage/get_storage.dart';

abstract class AuthSource {
  Future<BackendlessUser> register(
      String email, String password, String phoneNumber, String name);
  Future<BackendlessUser> login(String email, String password, bool remember);
}

class AuthRemoteSource implements AuthSource {
  final box = GetStorage(CommonDataBase.boxName);
  @override
  Future<BackendlessUser> login(
      String email, String password, bool remember) async {
    try {
      await Backendless.userService
          .login(email, password, stayLoggedIn: remember);
      final responseUser = await Backendless.userService.getCurrentUser(false);
      return responseUser!;
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message']);
      }
      throw Exception(e);
    }
  }

  @override
  Future<BackendlessUser> register(
      String email, String password, String phoneNumber, String name) async {
    try {
      final user = await Backendless.userService.register(
        BackendlessUser()
          ..email = email
          ..password = password
          ..putProperties({
            'phone': phoneNumber,
            'name': name,
          }),
      );
      await Backendless.userService.login(email, password);
      return user!;
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message']);
      }
      throw Exception(e);
    }
  }
}
