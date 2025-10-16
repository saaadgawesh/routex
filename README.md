RouteX-3 Fleet Management Application 🚚
تطبيق إدارة الأسطول والشحنات مبني بـ Flutter مع استخدام Cubit لإدارة الحالة.
📱 المميزات
للسائقين (Drivers)

✅ عرض الطلبات المتاحة والحالية
✅ قبول ورفض الطلبات
✅ تتبع حالة التوصيل
✅ عرض تفاصيل الطلب والعميل
✅ التواصل مع العملاء
✅ إحصائيات يومية

لأمناء المستودعات (Warehouse Managers)

✅ إدارة المخزون
✅ إضافة وتعديل المنتجات
✅ مسح رموز QR
✅ تتبع الشحنات
✅ تأكيد الشحنات للسائقين
✅ تنبيهات المخزون المنخفض

الميزات العامة

✅ نظام تسجيل دخول آمن
✅ إشعارات فورية
✅ الملف الشخصي وإعدادات الحساب
✅ دعم اللغة العربية
✅ واجهة مستخدم حديثة وسهلة

🏗️ البنية التقنية
State Management
dartflutter_bloc: ^8.1.3
equatable: ^2.0.5
UI & Fonts
dartgoogle_fonts: ^6.1.0
flutter_svg: ^2.0.9
Navigation
dartgo_router: ^12.1.3
📂 هيكل المشروع
lib/
├── core/
│   ├── theme/
│   │   ├── app_colors.dart
│   │   └── app_theme.dart
│   ├── constants/
│   │   └── app_constants.dart
│   ├── utils/
│   │   └── validators.dart
│   └── widgets/
│       ├── custom_app_bar.dart
│       ├── custom_bottom_nav_bar.dart
│       ├── loading_overlay.dart
│       └── empty_state.dart
│
├── features/
│   ├── splash/
│   │   ├── cubit/
│   │   │   ├── splash_cubit.dart
│   │   │   └── splash_state.dart
│   │   └── presentation/
│   │       └── splash_screen.dart
│   │
│   ├── auth/
│   │   ├── cubit/
│   │   │   ├── login_cubit.dart
│   │   │   ├── registration_cubit.dart
│   │   │   └── states...
│   │   └── presentation/
│   │       ├── login_screen.dart
│   │       ├── registration_welcome_screen.dart
│   │       ├── user_type_selection_screen.dart
│   │       └── registration_form_screen.dart
│   │
│   ├── driver/
│   │   ├── cubit/
│   │   │   ├── driver_cubit.dart
│   │   │   └── driver_state.dart
│   │   └── presentation/
│   │       ├── driver_home_screen.dart
│   │       └── order_details_screen.dart
│   │
│   ├── warehouse/
│   │   ├── cubit/
│   │   │   ├── warehouse_cubit.dart
│   │   │   └── warehouse_state.dart
│   │   └── presentation/
│   │       ├── warehouse_home_screen.dart
│   │       └── add_item_screen.dart
│   │
│   ├── profile/
│   │   ├── cubit/
│   │   │   ├── profile_cubit.dart
│   │   │   └── profile_state.dart
│   │   └── presentation/
│   │       ├── profile_screen.dart
│   │       └── edit_profile_screen.dart
│   │
│   └── notifications/
│       ├── cubit/
│       │   ├── notifications_cubit.dart
│       │   └── notifications_state.dart
│       └── presentation/
│           └── notifications_screen.dart
│
└── main.dart
🎨 الألوان
dartPrimary Orange: #FF6B35
Light Orange: #FF8C61
Dark Orange: #E85A2A
Dark Grey: #2D2D2D
Background: #FAFAFA
🚀 التثبيت والتشغيل
المتطلبات

Flutter SDK (>=3.0.0)
Dart SDK
Android Studio / VS Code
Git

خطوات التثبيت

استنساخ المشروع

bashgit clone https://github.com/your-repo/routex-app.git
cd routex-app

تثبيت المكتبات

bashflutter pub get

تشغيل التطبيق

bashflutter run
📱 الشاشات المتاحة
1. Splash Screen

شاشة البداية مع شعار التطبيق
تحميل البيانات الأولية

2. Authentication

Login Screen: تسجيل الدخول
Registration: إنشاء حساب جديد
User Type Selection: اختيار نوع المستخدم
Registration Form: نموذج التسجيل

3. Driver Screens

Home: قائمة الطلبات المتاحة
Order Details: تفاصيل الطلب الكاملة
Statistics: إحصائيات الأداء

4. Warehouse Screens

Inventory: إدارة المخزون
Shipments: تتبع الشحنات
Add Item: إضافة منتج جديد
QR Scanner: مسح رموز المنتجات

5. Profile & Settings

Profile: الملف الشخصي
Edit Profile: تعديل البيانات
Settings: الإعدادات
Notifications: الإشعارات

🔧 التخصيص
تغيير الألوان
عدل الألوان في lib/core/theme/app_colors.dart
تغيير الخطوط
عدل الخطوط في lib/core/theme/app_theme.dart
إضافة شاشة جديدة

أنشئ Cubit جديد في features/feature_name/cubit/
أضف الشاشة في features/feature_name/presentation/
أضف المسار في main.dart

📡 API Integration (قريباً)
dart// Example API Service
class ApiService {
  static const String baseUrl = 'https://api.routex.com';

  Future<Response> login(String email, String password) async {
    // Implementation
  }

  Future<List<Order>> getOrders() async {
    // Implementation
  }
}
🧪 الاختبارات
bash# Run all tests
flutter test

# Run with coverage
flutter test --coverage
📦 Build للإنتاج
Android
bashflutter build apk --release
# أو
flutter build appbundle --release
iOS
bashflutter build ios --release
🤝 المساهمة
نرحب بأي مساهمات! اتبع الخطوات التالية:

Fork المشروع
أنشئ branch جديد (git checkout -b feature/AmazingFeature)
Commit التغييرات (git commit -m 'Add some AmazingFeature')
Push للـ branch (git push origin feature/AmazingFeature)
افتح Pull Request

📝 الترخيص
هذا المشروع مرخص تحت MIT License
👥 الفريق

Developer:saad gawesh


📞 التواصل

Email: saadgawesh608@gmail.com
call me:+201031214881
