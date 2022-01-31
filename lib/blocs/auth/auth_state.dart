part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final UserClass? user;
  final bool loggedIn;
  final String? error;
  final bool processRequest;

  const AuthState(
      {this.user, this.loggedIn = false, this.error, bool? processRequest})
      : processRequest = processRequest ?? false;

  //copyWith

  AuthState copyWith({
    UserClass? user,
    bool? loggedIn,
    String? error,
    bool? processRequest,
  }) {
    return AuthState(
      user: user ?? this.user,
      loggedIn: loggedIn ?? this.loggedIn,
      error: error ?? this.error,
      processRequest: processRequest ?? this.processRequest,
    );
  }

  @override
  List<Object?> get props => [user, loggedIn, error, processRequest];
}
