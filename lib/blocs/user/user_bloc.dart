import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkiler/models/models.dart';
import 'package:walkiler/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(UserState()) {
    on<RegisterUserErrorsEvent>(_registerUserErrors);
    on<ClearRegisterErrorEvent>(_clearRegisterError);
  }
  Future<void> _registerUserErrors(
      RegisterUserErrorsEvent event, Emitter<UserState> emit) async {
    final Response response = await UserService.registerUser(
      event.name,
      event.surname,
      event.address,
      event.phone,
      event.email,
      event.password,
    );

    switch (response.statusCode) {
      case 200:
        emit(state.copyWith(
          userCreated: true,
          user: state.user,
          error: null,
        ));
        break;
      case 400:
        emit(state.copyWith(
          error: response.data['msg'],
          userCreated: false,
          user: state.user,
        ));
        break;
      case 500:
        emit(state.copyWith(
          error: response.data['msg'],
          userCreated: false,
          user: state.user,
        ));
        break;
      default:
        emit(state.copyWith(
          error: state.error,
          userCreated: state.userCreated,
          user: state.user,
        ));
    }
  }

// clear errors msg from register

  _clearRegisterError(ClearRegisterErrorEvent event, Emitter<UserState> emit) {
    print('ClearRegisterErrorEvent');
    emit(state.copyWith(
      error: "",
    ));
  }
}