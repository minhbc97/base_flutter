import 'package:base_flutter/routes/app_pages.dart';
import 'package:get/get.dart';

abstract class RouteManagement {
  /// Welcome ------------------------------------------------------------------
  static void goToWelcomeView() {
    Get.offAllNamed(AppRoutes.welcome);
  }

  static void goToServerMaintenanceView() {
    Get.offAllNamed(AppRoutes.maintenance);
  }

  static void goToServerOfflineView() {
    Get.offAllNamed(AppRoutes.offline);
  }

  static void gotToErrorView() {
    Get.offAllNamed(AppRoutes.error);
  }

  static void goToNetworkErrorView() {
    Get.offAllNamed(AppRoutes.noNetwork);
  }

  static void goToHomeView() {
    Get.offAllNamed(AppRoutes.home);
  }

  /// User ---------------------------------------------------------------------

  // static void goToBlockUserView(String id, String uname, MediaFile avatar) {
  //   Get.delete<BlockUserController>();
  //   Get.toNamed(AppRoutes.blockUser, arguments: {
  //     'id': id,
  //     'uname': uname,
  //     'avatar': avatar,
  //   });
  // }

  // static void goToUserProfileDetailsViewByUserId(String userId) {
  //   Get.delete<UserDetailsController>();
  //   Get.toNamed(AppRoutes.userProfile, arguments: [userId, 'uid']);
  // }

  // static void goToUserProfileDetailsViewByUsername(String username) {
  //   Get.delete<UserDetailsController>();
  //   Get.toNamed(AppRoutes.userProfile, arguments: [username, 'uname']);
  // }

  /// --------------------------------------------------------------------------

  /// Auth ---------------------------------------------------------------------

  static void goToLoginView() {
    Get.toNamed(AppRoutes.login);
  }

  static void goToRegisterView() {
    Get.toNamed(AppRoutes.register);
  }

  static void goToForgotPasswordView() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  // static void goToResetPasswordView() {
  //   Get.toNamed(AppRoutes.resetPassword);
  // }

  // static void goToSendVerifyAccountOtpView() {
  //   Get.toNamed(AppRoutes.sendVerifyAccountOtp);
  // }

  // static void goToVerifyAccountView() {
  //   Get.toNamed(AppRoutes.verifyAccount);
  // }

  // static void goToReactivateAccountView() {
  //   Get.toNamed(AppRoutes.reactivateAccount);
  // }

  /// --------------------------------------------------------------------------

  /// Go to back Page / Close Pages --------------------------------------------

  static void goToBack() {
    Get.back();
  }

  /// --------------------------------------------------------------------------
}
