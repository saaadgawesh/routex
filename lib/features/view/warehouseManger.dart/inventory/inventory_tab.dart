import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/features/view/warehouseManger.dart/inventory/inventory_card.dart';
import 'package:routex_app/features/viewmodel/warehouseManager/warehouseManager_state.dart';
import 'package:routex_app/features/viewmodel/warehouseManager/warehouse_cubit.dart';

class InventoryTab extends StatelessWidget {
  const InventoryTab();

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

        if (state is WarehouseInventoryLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.inventory.length,
            itemBuilder: (context, index) {
              final item = state.inventory[index];
              return InventoryCard(item: item);
            },
          );
        }

        return const Center(child: Text('لا توجد بيانات'));
      },
    );
  }
}
