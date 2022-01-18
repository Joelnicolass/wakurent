import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<SaveNewUserEvent>((_saveUser));
  }


  
  Future<void> _saveUser(
      SaveNewUserEvent event, Emitter<UserState> emit) async {
    final Response response = await UserService.saveUser(
      event.name,
      event.surname,
      event.address,
      event.phone,
      event.email,
      event.password,
    );

    print(response.data);
    
  }
}
