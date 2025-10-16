
import 'package:equatable/equatable.dart';

abstract class WarehouseState extends Equatable {
  const WarehouseState();

  @override
  List<Object> get props => [];
}

class WarehouseInitial extends WarehouseState {}

class WarehouseLoading extends WarehouseState {}

class WarehouseInventoryLoaded extends WarehouseState {
  final List<Map<String, dynamic>> inventory;
  const WarehouseInventoryLoaded(this.inventory);

  @override
  List<Object> get props => [inventory];
}

class WarehouseShipmentsLoaded extends WarehouseState {
  final List<Map<String, dynamic>> shipments;
  const WarehouseShipmentsLoaded(this.shipments);

  @override
  List<Object> get props => [shipments];
}
