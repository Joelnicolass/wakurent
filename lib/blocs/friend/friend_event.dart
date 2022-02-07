part of 'friend_bloc.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent();

  @override
  List<Object> get props => [];
}

// add firneds
class AddFriend extends FriendEvent {
  final String userId;
  final String name;
  final String surname;
  final String address;
  final String password;
  final String email;
  final String phone;

  AddFriend({
    required this.userId,
    required this.name,
    required this.surname,
    required this.address,
    required this.password,
    required this.email,
    required this.phone,
  });

  @override
  List<Object> get props => [{userId, name, surname, address, password, email, phone}];
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

