part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SaveNewUserEvent extends UserEvent {
  final String name;
  final String surname;
  final String address;
  final String email;
  final String password;
  final String phone;

  SaveNewUserEvent({
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
