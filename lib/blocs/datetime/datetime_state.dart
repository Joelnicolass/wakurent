part of 'datetime_bloc.dart';

abstract class DatetimeState extends Equatable {
  const DatetimeState();
  
  @override
  List<Object> get props => [];
}

class DatetimeInitial extends DatetimeState {}
