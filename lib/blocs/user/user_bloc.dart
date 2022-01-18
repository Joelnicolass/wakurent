import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/models/models.dart';
import 'package:walkiler/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<SaveNewUserEvent>((_saveUser));
  }

  Future<void> _saveUser(
      SaveNewUserEvent event, Emitter<UserState> emit) async {
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
}
