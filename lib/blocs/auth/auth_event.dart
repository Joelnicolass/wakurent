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

// event for reset error message from Login

class ClearErrorEvent extends AuthEvent {
  ClearErrorEvent();

  @override
  List<Object> get props => [];
}

// signout event

class SignOutEvent extends AuthEvent {
  SignOutEvent();

  @override
  List<Object> get props => [];
}

// get user profile event

class GetUserProfileEvent extends AuthEvent {
  GetUserProfileEvent();

  @override
  List<Object> get props => [];
}

class ProcessRequestEventAuth extends AuthEvent {
  ProcessRequestEventAuth();
}
