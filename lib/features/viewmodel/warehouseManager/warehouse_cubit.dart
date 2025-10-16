import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/features/viewmodel/warehouseManager/warehouseManager_state.dart';

class WarehouseCubit extends Cubit<WarehouseState> {
  WarehouseCubit() : super(WarehouseInitial());

  void loadInventory() {
    emit(WarehouseLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(WarehouseInventoryLoaded([
        {
          'id': 'W001',
          'name': 'أجهزة إلكترونية',
          'quantity': 45,
          'category': 'إلكترونيات',
          'status': 'available',
          'location': 'A-12',
        },
        {
          'id': 'W002',
          'name': 'مواد غذائية',
          'quantity': 120,
          'category': 'أغذية',
          'status': 'available',
          'location': 'B-05',
        },
        {
          'id': 'W003',
          'name': 'ملابس',
          'quantity': 8,
          'category': 'أزياء',
          'status': 'low_stock',
          'location': 'C-18',
        },
      ]));
    });
  }

  void loadShipments() {
    emit(WarehouseLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(WarehouseShipmentsLoaded([
        {
          'id': 'SH001',
          'driver': 'أحمد محمد',
          'items': 15,
          'destination': 'الرياض',
          'status': 'ready',
          'time': '2:30 PM',
        },
        {
          'id': 'SH002',
          'driver': 'محمد سعيد',
          'items': 8,
          'destination': 'جدة',
          'status': 'in_transit',
          'time': '1:00 PM',
        },
      ]));
    });
  }
}
