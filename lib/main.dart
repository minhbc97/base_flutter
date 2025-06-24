import 'package:base_flutter/app_services/auth_service.dart';
import 'package:base_flutter/app_services/network_controller.dart';
import 'package:base_flutter/app_services/route_service.dart';
import 'package:base_flutter/app_services/storage_service.dart';
import 'package:base_flutter/app_services/theme_controller.dart';
import 'package:base_flutter/constants/enums.dart';
import 'package:base_flutter/constants/hive_box_names.dart';
import 'package:base_flutter/constants/strings.dart';
import 'package:base_flutter/models/responses/auth_response.dart';
import 'package:base_flutter/routes/app_pages.dart';
import 'package:base_flutter/translations/app_translations.dart';
import 'package:base_flutter/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initPreAppServices();
  final networkService = NetworkController.instance;
  await networkService.init();

  runApplication();

  await _initPostAppServices();
}

Future<void> _initPreAppServices() async {
  AppUtility.log('Initializing PreApp Services');
  await GetStorage.init();
  await Hive.initFlutter();

  AppUtility.log('Registering Hive Adapters');

  Hive.registerAdapter(AuthResponseAdapter());

  AppUtility.log('Hive Adapters Registered');

  AppUtility.log('Opening Hive Boxes');

  await Hive.openBox<String>(HiveBoxNames.themeMode);

  AppUtility.log('Hive Boxes Opened');

  AppUtility.log('Initializing Get Services');

  Get.put(AppThemeController(), permanent: true);
  Get.put(AuthService(), permanent: true);

  AppUtility.log('Get Services Initialized');

  AppUtility.log('Checking Token');

  var authService = AuthService.find;

  await authService.getToken().then((token) async {
    if (token.isNotEmpty) {
      var isValid = await authService.validateLocalAuthToken();

      if (isValid == false) {
        await authService.deleteAllLocalDataAndCache();
        RouteService.set(RouteStatus.notLoggedIn);
      }

      // var hasData = await ProfileController.find.loadProfileDetails();
      var hasData = true;
      if (hasData) {
        // await PostController.find.loadLocalPosts();
        // await ChatController.find.loadLocalMessages();
        // await NotificationController.find.loadLocalNotification();

        if (RouteService.routeStatus != RouteStatus.loggedIn) {
          RouteService.set(RouteStatus.loggedIn);
        }

        AppUtility.log("User is logged in");
      } else {
        if (RouteService.routeStatus != RouteStatus.error) {
          RouteService.set(RouteStatus.error);
        }
        await StorageService.remove('profileData');
      }
    } else {
      if (RouteService.routeStatus != RouteStatus.notLoggedIn) {
        RouteService.set(RouteStatus.notLoggedIn);
      }
      AppUtility.log("User is not logged in", tag: 'error');
    }
  });

  AppUtility.log('Token Checked');

  AppUtility.log('PreApp Services Initialized');
}

Future<void> _initPostAppServices() async {
  final networkService = NetworkController.instance;

  if (networkService.isConnected == true) {
    // await validateSessionAndGetData();
    // Future.delayed(const Duration(seconds: 3), () {
    //   AppUpdateController.find.init();
    // });
  }
}

void runApplication() {
  AppUtility.log('Initializing App');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
  AppUtility.log('App Initialized');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  String _handleAppInitialRoute() {
    switch (RouteService.routeStatus) {
      case RouteStatus.init:
      case RouteStatus.notLoggedIn:
        return AppRoutes.welcome;
      case RouteStatus.error:
        return AppRoutes.error;
      case RouteStatus.noNetwork:
        return AppRoutes.noNetwork;
      case RouteStatus.serverOffline:
        return AppRoutes.offline;
      case RouteStatus.serverMaintenance:
        return AppRoutes.maintenance;
      case RouteStatus.loggedIn:
        return AppRoutes.home;
      default:
        return AppRoutes.welcome;
    }
  }

  ThemeMode _handleAppTheme(String mode) {
    if (mode == kDarkMode) {
      return ThemeMode.dark;
    }
    if (mode == kLightMode) {
      return ThemeMode.light;
    }
    return ThemeMode.system;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppThemeController>(
      builder: (logic) => ScreenUtilInit(
        designSize: const Size(392, 744),
        builder: (ctx, child) => GetMaterialApp(
          title: StringValues.appName,
          debugShowCheckedModeBanner: false,
          themeMode: _handleAppTheme(logic.themeMode),
          theme: logic.getLightThemeData(ctx),
          darkTheme: logic.getDarkThemeData(ctx),
          getPages: AppPages.pages,
          initialRoute: _handleAppInitialRoute(),
          translations: AppTranslation(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('vi', 'VN'),
        ),
      ),
    );
  }
}
