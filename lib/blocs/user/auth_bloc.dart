import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/models/models.dart';
import 'package:walkiler/services/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>(_login);
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    final Response response = await AuthService.login(
      event.email,
      event.password,
    );

    switch (response.statusCode) {
      case 200:
        emit(state.copyWith(
          loggedIn: true,
          user: null,
        ));
        break;
      case 400:
        print(response.data);
        emit(state.copyWith(
          loggedIn: false,
          user: null,
        ));
        break;
      default:
        emit(state.copyWith(
          loggedIn: state.loggedIn,
          user: state.user,
        ));
    }
  }
}
