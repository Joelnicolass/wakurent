part of 'friend_bloc.dart';

class FriendState extends Equatable {
  final List<UserClass> friends;
  final bool processRequest;

  FriendState({List<UserClass>? friends, bool? processRequest})
      : friends = friends ?? [],
        processRequest = processRequest ?? false;

  //create copywith
  FriendState copyWith({
    List<UserClass>? friends,
    bool? processRequest,
  }) {
    return FriendState(
      friends: friends ?? this.friends,
      processRequest: processRequest ?? this.processRequest,
    );
  }

  @override
  List<Object> get props => [friends];
}
