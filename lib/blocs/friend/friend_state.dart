part of 'friend_bloc.dart';

class FriendState extends Equatable {
  final List<UserClass> friends;
  final bool processRequest;
  final String error;
  final bool friendCreated;
  

  FriendState({List<UserClass>? friends, bool? processRequest, String? error, bool? friendCreated})
      : friends = friends ?? [],
        processRequest = processRequest ?? false,
        error = error ?? '',
        friendCreated = friendCreated ?? false
        ;

  //create copywith
  FriendState copyWith({
    List<UserClass>? friends,
    bool? processRequest,
    String? error,
    bool? friendCreated,
  }) {
    return FriendState(
      friends: friends ?? this.friends,
      processRequest: processRequest ?? this.processRequest,
      error: error ?? this.error,
      friendCreated: friendCreated?? this.friendCreated,
    );
  }

  @override
  List<Object> get props => [friends, processRequest, error, friendCreated];
}
