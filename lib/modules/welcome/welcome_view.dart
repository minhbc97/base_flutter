import 'package:base_flutter/constants/colors.dart';
import 'package:base_flutter/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: ColorValues.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: SizedBox(
          width: Dimens.screenWidth,
          height: Dimens.screenHeight,
          child: Text('Welcome'),
        ),
      ),
    );
  }
}
