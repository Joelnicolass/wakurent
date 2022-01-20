part of 'friend_bloc.dart';

class FriendState extends Equatable {
  final List<User> friends;

  FriendState({List<User>? friends}) : friends = friends ?? [];

  //create copywith
  FriendState copyWith({
    List<User>? friends,
  }) {
    return FriendState(
      friends: friends ?? this.friends,
    );
  }

  @override
  List<Object> get props => [friends];
}
