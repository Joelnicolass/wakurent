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
    on<AddFriend>(_addFriend);
    on<RegisterUserErrorsEvent>(_registerUserErrors);
  }

  Future<void> _addFriend(
      AddFriend event, Emitter<UserState> emit) async {
    //AuthBloc reference

    final Response response = await UserService.saveUser(
      event.name,
      event.surname,
      event.address,
      event.phone,
      event.email,
      event.password,
    );

    if (response.statusCode == 200) {
      emit(state.copyWith(user: state.user, userCreated: true));
    } else {
      emit(state.copyWith(user: state.user, userCreated: false));
    }
  }


  
  Future<void> _registerUserErrors(RegisterUserErrorsEvent event, Emitter<UserState> emit) async {
    final Response response = await UserService.registerUser(
      event.name,
      event.surname,
      event.address,
      event.phone,
      event.email,
      event.password,
    );

    print(response.data);

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


}

