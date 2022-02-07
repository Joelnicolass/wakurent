part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

// add a Friend

// class AddFriend extends UserEvent {
//   final String userId;
//   final String name;
//   final String surname;
//   final String address;
//   final String password;
//   final String email;
//   final String phone;

//   AddFriend({
//     required this.userId,
//     required this.name,
//     required this.surname,
//     required this.address,
//     required this.password,
//     required this.email,
//     required this.phone,
//   });

//   @override
//   List<Object> get props => [{userId, name, surname, address, password, email, phone}];
// }

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

// event for reset error message from Register

class ClearRegisterErrorEvent extends UserEvent {
  ClearRegisterErrorEvent();

  @override
  List<Object> get props => [];
}
