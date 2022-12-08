import 'package:bot_toast/bot_toast.dart';
import 'package:crendly/app/constants/app_theme.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/pages/otp_verification/otp_verification.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/pages/otp_verification/registration_success_loader_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:get/get.dart';

import 'presentation/modules/intro_screens/splash/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,));
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: AppTheme.applicationTheme(),
        home: const SplashScreen()
      ),
    );
  }
}

