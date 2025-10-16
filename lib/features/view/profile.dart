// lib/features/profile/cubit/profile_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routex_app/core/widget/out_lined_button.dart';
import 'package:routex_app/core/widget/showDialog.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void loadProfile() {
    emit(ProfileLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(ProfileLoaded({
        'name': 'أحمد محمد',
        'email': 'ahmed@example.com',
        'phone': '+966 50 123 4567',
        'userType': 'driver',
        'rating': 4.8,
        'completedOrders': 156,
        'joinDate': '2024-01-15',
      }));
    });
  }

  void updateProfile(Map<String, dynamic> data) {
    emit(ProfileUpdating());
    Future.delayed(const Duration(seconds: 1), () {
      emit(ProfileUpdated());
      loadProfile();
    });
  }

  void logout() {
    emit(ProfileLoggedOut());
  }
}

// lib/features/profile/cubit/profile_state.dart

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Map<String, dynamic> userData;
  const ProfileLoaded(this.userData);

  @override
  List<Object> get props => [userData];
}

class ProfileUpdating extends ProfileState {}

class ProfileUpdated extends ProfileState {}

class ProfileLoggedOut extends ProfileState {}

// lib/features/profile/presentation/profile_screen.dart

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..loadProfile(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D2D2D),
        title: const Text('الملف الشخصي'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit profile
            },
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFF6B35),
              ),
            );
          }

          if (state is ProfileLoaded) {
            final user = state.userData;

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Profile Header
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF6B35), Color(0xFFFF8C61)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        // Avatar
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Text(
                              user['name'][0],
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF6B35),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Name
                        Text(
                          user['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // User Type
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _getUserTypeText(user['userType']),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Stats
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _StatItem(
                                icon: Icons.star,
                                value: user['rating'].toString(),
                                label: 'التقييم',
                              ),
                              Container(
                                width: 1,
                                height: 40,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              _StatItem(
                                icon: Icons.check_circle,
                                value: user['completedOrders'].toString(),
                                label: 'طلب مكتمل',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Contact Info Section
                  _SectionCard(
                    title: 'معلومات الاتصال',
                    children: [
                      _InfoTile(
                        icon: Icons.email_outlined,
                        title: 'البريد الإلكتروني',
                        value: user['email'],
                      ),
                      const Divider(height: 1),
                      _InfoTile(
                        icon: Icons.phone_outlined,
                        title: 'رقم الهاتف',
                        value: user['phone'],
                      ),
                    ],
                  ),

                  // Settings Section
                  _SectionCard(
                    title: 'الإعدادات',
                    children: [
                      _MenuTile(
                        icon: Icons.notifications_outlined,
                        title: 'الإشعارات',
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {},
                          activeColor: const Color(0xFFFF6B35),
                        ),
                      ),
                      const Divider(height: 1),
                      _MenuTile(
                        icon: Icons.language,
                        title: 'اللغة',
                        subtitle: 'العربية',
                        onTap: () {},
                      ),
                      const Divider(height: 1),
                      _MenuTile(
                        icon: Icons.dark_mode_outlined,
                        title: 'الوضع الداكن',
                        trailing: Switch(
                          value: false,
                          onChanged: (value) {},
                          activeColor: const Color(0xFFFF6B35),
                        ),
                      ),
                    ],
                  ),

                  // More Options Section
                  _SectionCard(
                    title: 'المزيد',
                    children: [
                      _MenuTile(
                        icon: Icons.history,
                        title: 'سجل الطلبات',
                        onTap: () {},
                      ),
                      const Divider(height: 1),
                      _MenuTile(
                        icon: Icons.help_outline,
                        title: 'المساعدة والدعم',
                        onTap: () {},
                      ),
                      const Divider(height: 1),
                      _MenuTile(
                        icon: Icons.privacy_tip_outlined,
                        title: 'سياسة الخصوصية',
                        onTap: () {},
                      ),
                      const Divider(height: 1),
                      _MenuTile(
                        icon: Icons.info_outline,
                        title: 'عن التطبيق',
                        onTap: () {},
                      ),
                    ],
                  ),

                  // Logout Button
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomOutlinedbutton(
                        text: 'تسجيل الخروج',
                        onpressed: () {
                       customshowLogoutDialog(context);
                        },
                      )),

                  const SizedBox(height: 16),
                ],
              ),
            );
          }

          return const Center(child: Text('خطأ في تحميل البيانات'));
        },
      ),
    );
  }

  String _getUserTypeText(String type) {
    switch (type) {
      case 'driver':
        return 'سائق';
      case 'warehouse':
        return 'أمين مستودع';
      case 'admin':
        return 'مدير';
      default:
        return '';
    }
  }


}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B35).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFFFF6B35),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 20, color: Colors.grey[700]),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            )
          : null,
      trailing: trailing ??
          (onTap != null
              ? const Icon(Icons.chevron_right, color: Colors.grey)
              : null),
    );
  }
}

// lib/features/profile/presentation/edit_profile_screen.dart

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D2D2D),
        title: const Text('تعديل الملف الشخصي'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Avatar Edit
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: const Color(0xFFFF6B35).withOpacity(0.1),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Color(0xFFFF6B35),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF6B35),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Name Field
              TextFormField(
                controller: _nameController,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  labelText: 'الاسم الكامل',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال الاسم';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Email Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال البريد الإلكتروني';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Phone Field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  prefixIcon: const Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال رقم الهاتف';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 32),

              // Save Button
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  final isUpdating = state is ProfileUpdating;

                  return ElevatedButton(
                    onPressed: isUpdating
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ProfileCubit>().updateProfile({
                                'name': _nameController.text,
                                'email': _emailController.text,
                                'phone': _phoneController.text,
                              });
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isUpdating
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'حفظ التعديلات',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  );
                },
              ),

              const SizedBox(height: 12),


               CustomOutlinedbutton(
                text: 'إلغاء', onpressed: () { Navigator.pop(context); },
              )
            ],
          ),
        ),
      ),
    );
  }
}
