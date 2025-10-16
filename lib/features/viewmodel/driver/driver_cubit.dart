import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/features/viewmodel/driver/driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(DriverInitial());

  void loadOrders() {
    emit(DriverLoading());
    // Simulate loading orders
    Future.delayed(const Duration(seconds: 1), () {
      emit(const DriverOrdersLoaded([
        {
          'id': '001',
          'customerName': 'أحمد محمد',
          'address': 'الرياض، حي النخيل، شارع الملك فهد',
          'status': 'pending',
          'items': 3,
          'distance': '5.2 كم',
          'time': '30 دقيقة',
        },
        {
          'id': '002',
          'customerName': 'فاطمة علي',
          'address': 'جدة، حي الروضة، شارع التحلية',
          'status': 'in_progress',
          'items': 2,
          'distance': '2.8 كم',
          'time': '15 دقيقة',
        },
        {
          'id': '003',
          'customerName': 'محمد سعيد',
          'address': 'الدمام، حي الشاطئ، طريق الملك عبدالعزيز',
          'status': 'pending',
          'items': 5,
          'distance': '8.5 كم',
          'time': '45 دقيقة',
        },
      ]));
    });
  }

  void updateOrderStatus(String orderId, String status) {
    emit(DriverOrderUpdating());
    Future.delayed(const Duration(seconds: 1), () {
      emit(DriverOrderUpdated());
      loadOrders();
    });
  }
}
