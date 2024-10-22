// lib/utils/constants.dart
class Constants {
  // App Info
  static const String APP_NAME = 'Flutter Demo App';
  static const String APP_VERSION = '1.0.0';
  
  // Routes Names
  static const String ROUTE_LANDING = '/';
  static const String ROUTE_LOGIN = '/login';
  static const String ROUTE_HOME = '/home';
  static const String ROUTE_ABOUT = '/about';
  static const String ROUTE_PROFILE = '/profile';
  
  // Auth Constants
  static const String ADMIN_USERNAME = 'admin';
  static const String ADMIN_PASSWORD = 'admin123';
  
  // Messages
  static const String MSG_LOGIN_ERROR = 'Username atau password salah';
  static const String MSG_FIELD_REQUIRED = 'Field ini harus diisi';
  static const String MSG_PAGE_NOT_FOUND = 'Halaman tidak ditemukan';
  
  // Durations
  static const Duration ANIMATION_DURATION = Duration(milliseconds: 300);
  
  // Storage Keys
  static const String STORAGE_USER_KEY = 'user_data';
  
  // Asset Paths
  static const String ASSET_LOGO = 'assets/logo.png';
  
  // API Related (jika diperlukan)
  static const String API_BASE_URL = 'https://api.example.com';
  
  // Validation
  static const int MIN_PASSWORD_LENGTH = 6;
  static const String PASSWORD_REGEX = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
}