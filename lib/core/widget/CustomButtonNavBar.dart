import 'package:flutter/material.dart';
import 'package:routex_app/features/widget/NavBarItem.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarItem(
                icon: Icons.home_rounded,
                label: 'الرئيسية',
                isSelected: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              NavBarItem(
                icon: Icons.local_shipping_rounded,
                label: 'الطلبات',
                isSelected: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              NavBarItem(
                icon: Icons.notifications_rounded,
                label: 'الإشعارات',
                isSelected: currentIndex == 2,
                onTap: () => onTap(2),
              ),
              NavBarItem(
                icon: Icons.person_rounded,
                label: 'الملف الشخصي',
                isSelected: currentIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
