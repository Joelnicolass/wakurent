import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/models/models.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc() : super(FriendState()) {
    on<OnGetFriendsEvent>(_onGetFriendsEvent);
    on<ProcessRequestFriendEvent>(_processRequestFriendEvent);
  }

  _onGetFriendsEvent(OnGetFriendsEvent event, Emitter<FriendState> emit) {
    emit(state.copyWith(
      friends: event.friends,
    ));
  }

  _processRequestFriendEvent(
      ProcessRequestFriendEvent event, Emitter<FriendState> emit) {
    emit(state.copyWith(
      friends: state.friends,
      processRequest: true,
    ));
  }
}
