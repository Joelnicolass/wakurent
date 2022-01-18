part of 'user_bloc.dart';

class UserState extends Equatable {
  final bool? userCreated;
  final UserClass? user;

  UserState({this.userCreated, this.user});

  // copywith
  UserState copyWith({bool? userCreated, UserClass? user}) {
    return UserState(
      userCreated: userCreated ?? this.userCreated,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [userCreated, user];
}
