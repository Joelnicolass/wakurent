import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/models/models.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc() : super(FriendState()) {
    on<OnGetFriendsEvent>(_onGetFriendsEvent);
  }

  _onGetFriendsEvent(OnGetFriendsEvent event, Emitter<FriendState> emit) {
    emit(state.copyWith(
      friends: event.friends,
    ));
  }
}
