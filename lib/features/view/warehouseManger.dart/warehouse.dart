// lib/features/warehouse/cubit/warehouse_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/core/widget/state_column.dart';
import 'package:routex_app/features/view/warehouseManger.dart/AddItemScreen.dart';
import 'package:routex_app/features/view/warehouseManger.dart/inventory/inventory_tab.dart';
import 'package:routex_app/features/view/warehouseManger.dart/shipment/shipment_Tab.dart';
import 'package:routex_app/features/view/warehouseManger.dart/tabbutton.dart';
import 'package:routex_app/features/viewmodel/warehouseManager/warehouse_cubit.dart';

class WarehouseHomeScreen extends StatelessWidget {
  const WarehouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WarehouseCubit()..loadInventory(),
      child: const WarehouseHomeView(),
    );
  }
}

class WarehouseHomeView extends StatefulWidget {
  const WarehouseHomeView({super.key});

  @override
  State<WarehouseHomeView> createState() => _WarehouseHomeViewState();
}

class _WarehouseHomeViewState extends State<WarehouseHomeView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D2D2D),
        title: const Text('إدارة المستودع'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Stats Overview
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF6B35), Color(0xFFFF8C61)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF6B35).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const StatColumn(
                      icon: Icons.inventory,
                      value: '1,234',
                      label: 'إجمالي المنتجات',
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    const StatColumn(
                      icon: Icons.local_shipping,
                      value: '45',
                      label: 'شحنات اليوم',
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    const StatColumn(
                      icon: Icons.warning_amber,
                      value: '12',
                      label: 'مخزون منخفض',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Tab Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TabButton(
                    label: 'المخزون',
                    icon: Icons.inventory_2,
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      setState(() => _selectedIndex = 0);
                      context.read<WarehouseCubit>().loadInventory();
                    },
                  ),
                ),
                Expanded(
                  child: TabButton(
                    label: 'الشحنات',
                    icon: Icons.local_shipping,
                    isSelected: _selectedIndex == 1,
                    onTap: () {
                      setState(() => _selectedIndex = 1);
                      context.read<WarehouseCubit>().loadShipments();
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Content
          Expanded(
            child: _selectedIndex == 0
                ? const InventoryTab()
                : const ShipmentsTab(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>const AddItemScreen()));
        },
        backgroundColor: const Color(0xFFFF6B35),
        icon: const Icon(Icons.add),
        label: Text(_selectedIndex == 0 ? 'إضافة منتج' : 'شحنة جديدة'),
      ),
    );
  }
}
