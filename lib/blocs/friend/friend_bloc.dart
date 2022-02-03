import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/models/models.dart';
import 'package:walkiler/services/services.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc() : super(FriendState()) {
    on<AddFriend>(_addFriend);
    on<OnGetFriendsEvent>(_onGetFriendsEvent);
    on<ProcessRequestFriendEvent>(_processRequestFriendEvent);
    on<DeleteFriendEvent>(_deleteFriend);
  }

  Future<void> _addFriend(AddFriend event, Emitter<FriendState> emit) async {
    final Response response = await UserService.addFriend(
      event.userId,
      event.name,
      event.surname,
      event.address,
      event.password,
      event.email,
      event.phone,
    );

    switch (response.statusCode) {
      case 200:
        emit(state.copyWith(
          friendCreated: true,
          friends: state.friends,
          processRequest: false,
          error: null,
        ));
        break;
      case 400:
        emit(state.copyWith(
            friendCreated: false,
            friends: state.friends,
            processRequest: false,
            error: response.data['msg']));
        break;
      case 500:
        emit(state.copyWith(
          friendCreated: false,
            friends: state.friends,
            processRequest: false,
            error: response.data['msg']));
        break;
      default:
        emit(state.copyWith(
          friendCreated: state.friendCreated,
          friends: state.friends,
          processRequest: false,
          error: state.error,
        ));
    }
  }

  _onGetFriendsEvent(OnGetFriendsEvent event, Emitter<FriendState> emit) {
    emit(state.copyWith(
      friends: event.friends,
      processRequest: false,
    ));
  }

// delete wakure

  Future<void> _deleteFriend(
      DeleteFriendEvent event, Emitter<FriendState> emit) async {
    final Response response =
        await FriendService.deleteFriend(event.friendId, event.userId);

    if (response.statusCode == 200) {
      emit(state.copyWith(
        friends: state.friends
            .where((friend) => friend.id != event.friendId)
            .toList(),
        processRequest: false,
      ));
    }
  }

  _processRequestFriendEvent(
      ProcessRequestFriendEvent event, Emitter<FriendState> emit) {
    emit(state.copyWith(
      processRequest: true,
      friends: state.friends,
    ));
  }
}
