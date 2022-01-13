part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// auth login event
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

// event for reset error message

class ClearErrorEvent extends AuthEvent {
  ClearErrorEvent();

  @override
  List<Object> get props => [];
}
