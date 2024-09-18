import 'package:aspen_explore_application/screens/auth/repo/repository.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryAbstract repo;
  AuthBloc(this.repo) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      try {
        if (event is AuthRegister) {
          emit(Authloading());
          final user = await repo.register(
              event.email, event.password, event.phoneNumber, event.name);
          emit(AuthSucess(user));
        } else if (event is AuthLogin) {
          emit(Authloading());
          final user =
              await repo.login(event.email, event.password, event.remember);
          emit(AuthSucess(user));
        } else if (event is AuthStarted) {
          emit(AuthInitial());
        }
      } catch (e) {
        emit(
          AuthError(
            (Exception(e)),
          ),
        );
      }
    });
  }
}
