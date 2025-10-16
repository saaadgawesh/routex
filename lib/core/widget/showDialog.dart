import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/profile.dart';

customshowLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: const Text(
        'تسجيل الخروج',
        textAlign: TextAlign.center,
      ),
      content: const Text(
        'هل أنت متأكد من تسجيل الخروج؟',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<ProfileCubit>().logout();
            Navigator.pop(context);
            // Navigate to login screen
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text('تسجيل الخروج'),
        ),
      ],
    ),
  );
}
