part of 'friend_bloc.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent();

  @override
  List<Object> get props => [];
}

// get Friends

class OnGetFriendsEvent extends FriendEvent {
  final List<UserClass> friends;

  const OnGetFriendsEvent({required this.friends});

  @override
  List<Object> get props => [friends];
}

// process Request

class ProcessRequestFriendEvent extends FriendEvent {
  ProcessRequestFriendEvent();
}

// delete Friend

class DeleteFriendEvent extends FriendEvent {
  final friendId;
  final userId;

  DeleteFriendEvent({required this.friendId, required this.userId});

  @override
  List<Object> get props => [friendId, userId];
}

