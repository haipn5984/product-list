import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:product_list/core/di/module.dart' as di;

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();
  await di.configureDependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..indicatorSize = 48
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskColor = Colors.red
    ..maskType = EasyLoadingMaskType.none;
}
