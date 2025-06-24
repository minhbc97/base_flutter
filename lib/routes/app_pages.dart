import 'package:base_flutter/modules/welcome/welcome_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static var defaultTransition = Transition.circularReveal;
  static final pages = [
    GetPage(
      name: _Routes.welcome,
      page: WelcomeView.new,
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
    // GetPage(
    //   name: _Routes.maintenance,
    //   page: ServerMaintenanceView.new,
    //   transitionDuration: transitionDuration,
    //   transition: defaultTransition,
    // ),

    // GetPage(
    //   name: _Routes.offline,
    //   page: ServerOfflineView.new,
    //   transitionDuration: transitionDuration,
    //   transition: defaultTransition,
    // ),

    // GetPage(
    //   name: _Routes.error,
    //   page: AppErrorView.new,
    //   transitionDuration: transitionDuration,
    //   transition: defaultTransition,
    // ),

    // GetPage(
    //   name: _Routes.noNetwork,
    //   page: NoNetworkView.new,
    //   transitionDuration: transitionDuration,
    //   transition: defaultTransition,
    // ),

    // GetPage(
    //   name: _Routes.welcome,
    //   page: WelcomeView.new,
    //   transitionDuration: transitionDuration,
    //   transition: defaultTransition,
    // ),

    // GetPage(
    //   name: _Routes.login,
    //   page: LoginView.new,
    //   transitionDuration: transitionDuration,
    //   binding: LoginBinding(),
    //   transition: defaultTransition,
    // ),

    // GetPage(
    //   name: _Routes.register,
    //   page: RegisterView.new,
    //   transitionDuration: transitionDuration,
    //   binding: RegisterBinding(),
    //   transition: defaultTransition,
    // ),

    // GetPage(
    //   name: _Routes.home,
    //   page: HomeView.new,
    //   transitionDuration: transitionDuration,
    //   binding: InitialBinding(),
    //   transition: defaultTransition,
    // ),

    /// ------------------------------------------------------------------------

    ///  Settings Pages --------------------------------------------------------

    /// ------------------------------------------------------------------------

    /// HELP SETTINGS -------------------------------------------------------

    /// ------------------------------------------------------------------------

    /// ACCOUNT SETTINGS -------------------------------------------------------

    /// ------------------------------------------------------------------------

    /// Verify Password --------------------------------------------------------

    // GetPage(
    //   name: _Routes.verifyPassword,
    //   page: VerifyPasswordView.new,
    //   binding: VerifyPasswordBinding(),
    //   transitionDuration: transitionDuration,
    //   transition: defaultTransition,
    // ),

    /// ------------------------------------------------------------------------

    ///  SECURITY SETTINGS -----------------------------------------------------

    // GetPage(
    //   name: _Routes.changePassword,
    //   page: ChangePasswordView.new,
    //   transitionDuration: transitionDuration,
    //   binding: ChangePasswordBinding(),
    //   transition: defaultTransition,
    // ),

    /// ------------------------------------------------------------------------

    /// Privacy Settings -------------------------------------------------------

    // GetPage(
    //   name: _Routes.accountPrivacySettings,
    //   page: AccountPrivacyView.new,
    //   binding: PrivacySettingBinding(),
    //   transitionDuration: transitionDuration,
    //   transition: defaultTransition,
    // ),

    /// ------------------------------------------------------------------------

    /// App Update -------------------------------------------------------------

    // GetPage(
    //   name: _Routes.appUpdate,
    //   page: AppUpdateView.new,
    //   transitionDuration: transitionDuration,
    //   transition: defaultTransition,
    // ),

    /// ------------------------------------------------------------------------

    /// Report Issue -----------------------------------------------------------

    // GetPage(
    //   name: _Routes.reportIssueSettings,
    //   page: ReportAppIssueView.new,
    //   binding: ReportAppIssueBinding(),
    //   transitionDuration: transitionDuration,
    //   transition: defaultTransition,
    // ),

    // GetPage(
    //   name: _Routes.reportIssue,
    //   page: ReportView.new,
    //   binding: ReportBinding(),
    //   transitionDuration: transitionDuration,
    //   transition: defaultTransition,
    // ),

    /// ------------------------------------------------------------------------
  ];

  static var transitionDuration = const Duration(milliseconds: 500);
}
