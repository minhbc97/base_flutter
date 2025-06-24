import 'package:base_flutter/constants/dimens.dart';
import 'package:base_flutter/constants/styles.dart';
import 'package:base_flutter/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

const String kThemeModeBox = 'themeMode';
const String kThemeModeKey = 'themeMode';
const String kSystemMode = 'system';
const String kLightMode = 'light';
const String kDarkMode = 'dark';
const String kDefaultFontFamily = 'Be Vietnam Pro';

class AppThemeController extends GetxController {
  final _themeMode = kSystemMode.obs;

  @override
  void onInit() {
    super.onInit();
    getThemeMode();
  }

  static AppThemeController get find => Get.find();

  String get themeMode => _themeMode.value;

  void getSystemChromeData() {
    var themeBrightness = SchedulerBinding.instance.window.platformBrightness;

    if (themeMode == kLightMode) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.lightBlue,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.lightBlue,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else if (themeMode == kDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      if (themeBrightness == Brightness.light) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.lightBlue,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.lightBlue,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        );
      } else {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );
      }
    }
  }

  ThemeData getLightThemeData(BuildContext ctx) {
    getSystemChromeData();
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
      iconTheme: const IconThemeData(color: Colors.grey),
      scaffoldBackgroundColor: Colors.lightBlue,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.lightBlue),
      cardColor: Colors.lightBlue,
      shadowColor: Colors.grey.withAlpha(12),
      cardTheme: const CardTheme(color: Colors.lightBlue),
      dialogTheme:
          const DialogTheme(backgroundColor: Colors.lightBlue),
      dialogBackgroundColor: Colors.lightBlue,
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: Colors.lightBlue,
        surfaceTintColor: Colors.lightBlue,
        modalBackgroundColor: Colors.lightBlue,
        modalBarrierColor: Colors.black.withOpacity(0.5),
      ),
      dividerColor: Colors.grey,
      disabledColor: Colors.grey,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.black,
        contentTextStyle: TextStyle(
          color: Colors.white,
        ),
        actionTextColor: Colors.blue,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: const ButtonStyle().copyWith(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: Dimens.edgeInsets16,
        constraints: BoxConstraints(
          maxWidth: ctx.width,
        ),
        labelStyle: AppStyles.p.copyWith(
          color: Colors.white,
        ),
        floatingLabelStyle: AppStyles.p.copyWith(
          color: Colors.white.withAlpha(140),
        ),
        hintStyle: AppStyles.p.copyWith(
          color: Colors.white.withAlpha(140),
        ),
        errorStyle: AppStyles.p.copyWith(
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withAlpha(20),
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
      ),
      fontFamily: kDefaultFontFamily,
      textTheme: const TextTheme().copyWith(
        bodyLarge: const TextStyle(
          color: Colors.white,
        ),
        bodyMedium: const TextStyle(
          color: Colors.white,
        ),
        bodySmall: const TextStyle(
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          color: Colors.white.withAlpha(180),
        ),
        titleSmall: TextStyle(
          color: Colors.white.withAlpha(140),
        ),
      ),
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  ThemeData getDarkThemeData(BuildContext ctx) {
    getSystemChromeData();
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
      iconTheme: const IconThemeData(color: Colors.grey),
      scaffoldBackgroundColor: Colors.black,
      shadowColor: Colors.grey.withAlpha(12),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      cardColor: Colors.black,
      cardTheme: const CardTheme(color: Colors.black),
      dialogTheme:
          const DialogTheme(backgroundColor: Colors.black),
      dialogBackgroundColor: Colors.black,
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        modalBackgroundColor: Colors.black,
        modalBarrierColor: Colors.black.withOpacity(0.5),
      ),
      dividerColor: Colors.grey,
      disabledColor: Colors.grey,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.black,
        contentTextStyle: TextStyle(
          color: Colors.white,
        ),
        actionTextColor: Colors.blue,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: const ButtonStyle().copyWith(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        contentPadding: Dimens.edgeInsets16,
        constraints: BoxConstraints(
          maxWidth: ctx.width,
        ),
        labelStyle: AppStyles.p.copyWith(
          color: Colors.white,
        ),
        floatingLabelStyle: AppStyles.p.copyWith(
          color: Colors.white.withAlpha(140),
        ),
        hintStyle: AppStyles.p.copyWith(
          color: Colors.white.withAlpha(140),
        ),
        errorStyle: AppStyles.p.copyWith(
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
      ),
      fontFamily: kDefaultFontFamily,
      textTheme: const TextTheme().copyWith(
        bodyLarge: const TextStyle(
          color: Colors.white,
        ),
        bodyMedium: const TextStyle(
          color: Colors.white,
        ),
        bodySmall: const TextStyle(
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          color: Colors.white.withAlpha(180),
        ),
        titleSmall: TextStyle(
          color: Colors.white.withAlpha(140),
        ),
      ),
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  void setThemeMode(String mode) async {
    _themeMode.value = mode;
    await HiveService.put<String>(kThemeModeBox, kThemeModeKey, mode);
    update();
  }

  void getThemeMode() async {
    var themeMode = await HiveService.get<String>(kThemeModeBox, kThemeModeKey);

    switch (themeMode) {
      case kSystemMode:
        _themeMode.value = kSystemMode;
        break;
      case kLightMode:
        _themeMode.value = kLightMode;
        break;
      case kDarkMode:
        _themeMode.value = kDarkMode;
        break;
      default:
        _themeMode.value = kSystemMode;
        break;
    }
    update();
  }
}
