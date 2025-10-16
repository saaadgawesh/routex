import 'package:equatable/equatable.dart';

abstract class DriverState extends Equatable {
  const DriverState();

  @override
  List<Object> get props => [];
}

class DriverInitial extends DriverState {}

class DriverLoading extends DriverState {}

class DriverOrdersLoaded extends DriverState {
  final List<Map<String, dynamic>> orders;
  const DriverOrdersLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}

class DriverOrderUpdating extends DriverState {}

class DriverOrderUpdated extends DriverState {}
