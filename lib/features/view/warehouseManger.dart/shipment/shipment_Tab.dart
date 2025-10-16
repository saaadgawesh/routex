import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/features/view/warehouseManger.dart/shipment/ShipmentCard.dart';
import 'package:routex_app/features/viewmodel/warehouseManager/warehouseManager_state.dart';
import 'package:routex_app/features/viewmodel/warehouseManager/warehouse_cubit.dart';

class ShipmentsTab extends StatelessWidget {
  const ShipmentsTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarehouseCubit, WarehouseState>(
      builder: (context, state) {
        if (state is WarehouseLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFFF6B35),
            ),
          );
        }

        if (state is WarehouseShipmentsLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.shipments.length,
            itemBuilder: (context, index) {
              final shipment = state.shipments[index];
              return ShipmentCard(shipment: shipment);
            },
          );
        }

        return const Center(child: Text('لا توجد شحنات'));
      },
    );
  }
}
