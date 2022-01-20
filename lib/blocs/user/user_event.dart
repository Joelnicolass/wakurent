part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

// save user

class AddFriend extends UserEvent {
  final String name;
  final String surname;
  final String address;
  final String email;
  final String password;
  final String phone;

  AddFriend({
    required this.name,
    required this.surname,
    required this.address,
    required this.email,
    required this.password,
    required this.phone,
  });
}

// user created
class UserCreatedEvent extends UserEvent {
  UserCreatedEvent();
}

// register user error

class RegisterUserErrorsEvent extends UserEvent {
  final String name;
  final String surname;
  final String address;
  final String email;
  final String password;
  final String phone;

  RegisterUserErrorsEvent({
    required this.name,
    required this.surname,
    required this.address,
    required this.email,
    required this.password,
    required this.phone,
  });
  
    @override
  List<Object> get props => [name, surname, address, email, password, phone];
}
