import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/features/viewmodel/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> initialize() async {
    emit(SplashLoading());

    // Simulate initialization (checking auth, loading data, etc.)
    await Future.delayed(const Duration(seconds: 3));

    // Navigate to appropriate screen based on auth status
    emit(SplashCompleted());
  }
}
