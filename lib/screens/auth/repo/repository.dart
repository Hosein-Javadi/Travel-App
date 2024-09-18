import 'package:aspen_explore_application/screens/auth/source/source.dart';
import 'package:backendless_sdk/backendless_sdk.dart';

abstract class AuthRepositoryAbstract {
  Future<BackendlessUser> register(
      String email, String password, String phoneNumber, String name);
  Future<BackendlessUser> login(String email, String password);
}

class AuthRepository implements AuthRepositoryAbstract {
  final AuthSource source;

  AuthRepository({required this.source});

  @override
  Future<BackendlessUser> login(String email, String password) async {
    final data = await source.login(email, password);
    return data;
  }

  @override
  Future<BackendlessUser> register(
      String email, String password, String phoneNumber, String name) async {
    final data = await source.register(email, password, phoneNumber, name);
    return data;
  }
}
