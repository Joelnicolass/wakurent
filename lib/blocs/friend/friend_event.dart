part of 'friend_bloc.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent();

  @override
  List<Object> get props => [];
}


class OnGetFriendsEvent extends FriendEvent {
  final List<User> friends;

  const OnGetFriendsEvent({required this.friends});

  @override
  List<Object> get props => [friends];
}