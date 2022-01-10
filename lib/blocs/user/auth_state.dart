part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final UserClass? user;
  final bool loggedIn;

  const AuthState({
    this.user,
    this.loggedIn = false,
  });

  //copyWith

  AuthState copyWith({
    UserClass? user,
    bool? loggedIn,
  }) {
    return AuthState(
      user: user ?? this.user,
      loggedIn: loggedIn ?? this.loggedIn,
    );
  }

  @override
  List<Object?> get props => [user, loggedIn];
}
