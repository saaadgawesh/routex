
import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class UserTypeSelected extends RegistrationState {
  final String userType;
  const UserTypeSelected(this.userType);

  @override
  List<Object> get props => [userType];
}

class RegistrationInProgress extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {}

class RegistrationError extends RegistrationState {
  final String message;
  const RegistrationError(this.message);

  @override
  List<Object> get props => [message];
}
