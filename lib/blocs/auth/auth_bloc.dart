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
    on<ClearErrorEvent>(_clearError);
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    final Response response = await AuthService.login(
      event.email,
      event.password,
    );

    print(response.data);

    switch (response.statusCode) {
      case 200:
        final User data = User.fromJson(response.toString());
        emit(state.copyWith(
          loggedIn: true,
          user: data.user,
          error: null,
        ));
        break;
      case 400:
        emit(state.copyWith(
          loggedIn: false,
          user: null,
          error: response.data['msg'],
        ));
        break;
      case 500:
        emit(state.copyWith(
          loggedIn: false,
          user: null,
          error: response.data['msg'],
        ));
        break;
      default:
        emit(state.copyWith(
          loggedIn: state.loggedIn,
          user: state.user,
          error: state.error,
        ));
    }
  }

  _clearError(ClearErrorEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      loggedIn: state.loggedIn,
      user: state.user,
      error: null,
    ));
  }
}
