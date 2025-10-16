import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/features/viewmodel/login/loginstate.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) {
    emit(LoginLoading());

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      if (email.isNotEmpty && password.isNotEmpty) {
        emit(const LoginSuccess(userType: 'driver'));
      } else {
        emit(const LoginError('البريد الإلكتروني أو كلمة المرور غير صحيحة'));
      }
    });
  }

  void resetPassword(String email) {
    emit(PasswordResetLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(PasswordResetSuccess());
    });
  }
}
