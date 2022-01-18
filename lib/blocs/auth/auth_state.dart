part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final UserClass? user;
  final bool loggedIn;
  final String? error;

  const AuthState({this.user, this.loggedIn = false, this.error});

  //copyWith

  AuthState copyWith({
    UserClass? user,
    bool? loggedIn,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      loggedIn: loggedIn ?? this.loggedIn,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [user, loggedIn, error];
}
