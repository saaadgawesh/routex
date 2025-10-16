import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String userType;
  const LoginSuccess({required this.userType});

  @override
  List<Object> get props => [userType];
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}

class PasswordResetLoading extends LoginState {}

class PasswordResetSuccess extends LoginState {}
