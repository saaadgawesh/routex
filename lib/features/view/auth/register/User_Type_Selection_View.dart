import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/features/view/auth/register/UserTypeCard.dart';
import 'package:routex_app/features/view/driver/driver.dart';
import 'package:routex_app/features/view/warehouseManger.dart/warehouse.dart';
import 'package:routex_app/features/viewmodel/register/register_cubit.dart';
import 'package:routex_app/features/viewmodel/register/register_state.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  const UserTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: const UserTypeSelectionView(),
    );
  }
}

class UserTypeSelectionView extends StatelessWidget {
  const UserTypeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'اختر نوع الحساب',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          String? selectedType;
          if (state is UserTypeSelected) {
            selectedType = state.userType;
          }

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                const Text(
                  'من أنت؟',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'اختر نوع حسابك للمتابعة',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 40),

                // Driver Option
                UserTypeCard(
                  icon: Icons.local_shipping_rounded,
                  title: 'سائق',
                  subtitle: 'توصيل الطلبات والشحنات',
                  isSelected: selectedType == 'driver',
                  onTap: () {
                    context.read<RegistrationCubit>().selectUserType('driver');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DriverHomeScreen(),
                    ));
                  },
                ),

                const SizedBox(height: 16),

                // Warehouse Manager Option
                UserTypeCard(
                  icon: Icons.warehouse_rounded,
                  title: 'أمين مستودع',
                  subtitle: 'إدارة المخزون والشحنات',
                  isSelected: selectedType == 'warehouse',
                  onTap: () {
                    context
                        .read<RegistrationCubit>()
                        .selectUserType('warehouse');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WarehouseHomeScreen(),
                    ));
                  },
                ),

                const SizedBox(height: 16),

                const Spacer(),

                //       ? () {

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
