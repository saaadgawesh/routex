import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/features/viewmodel/register/register_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  void selectUserType(String userType) {
    emit(UserTypeSelected(userType));
  }

  void goToNextStep() {
    if (state is UserTypeSelected) {
      emit(RegistrationInProgress());
    }
  }

  void submitRegistration(Map<String, dynamic> data) {
    emit(RegistrationLoading());
    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      emit(RegistrationSuccess());
    });
  }
}
