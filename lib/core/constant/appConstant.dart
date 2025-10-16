
// lib/core/constants/app_constants.dart
class AppConstants {
  // App Info
  static const String appName = 'RouteX-3';
  static const String appVersion = '1.0.0';

  // API Endpoints (example)
  static const String baseUrl = 'https://api.routex.com';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';

  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userTypeKey = 'user_type';
  static const String userDataKey = 'user_data';

  // User Types
  static const String userTypeDriver = 'driver';
  static const String userTypeWarehouse = 'warehouse';
  static const String userTypeAdmin = 'admin';

  // Order Status
  static const String orderStatusPending = 'pending';
  static const String orderStatusInProgress = 'in_progress';
  static const String orderStatusCompleted = 'completed';
  static const String orderStatusCancelled = 'cancelled';

  // Shipment Status
  static const String shipmentStatusReady = 'ready';
  static const String shipmentStatusInTransit = 'in_transit';
  static const String shipmentStatusDelivered = 'delivered';

  // Animations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 400);
  static const Duration longAnimationDuration = Duration(milliseconds: 600);

  // Padding & Spacing
  static const double smallPadding = 8.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 24.0;

  // Border Radius
  static const double smallRadius = 8.0;
  static const double mediumRadius = 12.0;
  static const double largeRadius = 16.0;
}


