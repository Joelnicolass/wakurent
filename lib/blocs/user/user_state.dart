part of 'user_bloc.dart';

class UserState extends Equatable {
  final bool? userCreated;
  final UserClass? user;
  final String? error;

  const UserState({this.userCreated, this.user, this.error});

  // copywith
  UserState copyWith({
    bool? userCreated, 
    UserClass? user, 
    String? error}) {
    
    return UserState(
      userCreated: userCreated ?? this.userCreated,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [userCreated, user, error];
}
