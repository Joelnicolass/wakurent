import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import 'package:walkiler/models/models.dart';
import 'package:walkiler/services/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>(_login);
    on<ClearErrorEvent>(_clearError);
    on<SignOutEvent>(_signOut);
    on<GetUserProfileEvent>(_getUserProfile);
    on<ProcessRequestEventAuth>(_processRequestEventAuth);
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

  _signOut(SignOutEvent event, Emitter<AuthState> emit) {
    //delete token from secure storage

    SecureStorage.deleteToken();

    emit(state.copyWith(
      loggedIn: false,
      user: null,
      error: null,
    ));
  }

  Future<void> _getUserProfile(
      GetUserProfileEvent event, Emitter<AuthState> emit) async {
    final Response response = await UserService.getUser(state.user!.id);

    final User data = User.fromJson(response.toString());

    print(data.user.role);

    if (response.statusCode == 200) {
      emit(state.copyWith(
        loggedIn: state.loggedIn,
        user: data.user,
        error: state.error,
      ));
    }
  }

  Future<void> _processRequestEventAuth(
      ProcessRequestEventAuth event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      error: state.error,
      loggedIn: state.loggedIn,
      user: state.user,
      processRequest: true,
    ));
  }
}
