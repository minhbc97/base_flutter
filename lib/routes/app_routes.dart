part of 'app_pages.dart';

abstract class AppRoutes {
  static const home = _Routes.home;
  static const login = _Routes.login;
  static const register = _Routes.register;
  static const forgotPassword = _Routes.forgotPassword;
  static const verifyEmail = _Routes.verifyEmail;
  static const verifyOtp = _Routes.verifyOtp;
  static const verifyPassword = _Routes.verifyPassword;
  static const welcome = _Routes.welcome;
  static const maintenance = _Routes.maintenance;
  static const offline = _Routes.offline;
  static const error = _Routes.error;
  static const noNetwork = _Routes.noNetwork;
}

abstract class _Routes {
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const verifyEmail = '/verify-email';
  static const verifyOtp = '/verify-otp';
  static const verifyPassword = '/verify-password';
  static const welcome = '/welcome';
  static const maintenance = '/maintenance';
  static const offline = '/offline';
  static const error = '/error';
  static const noNetwork = '/no-network';
}
