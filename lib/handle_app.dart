import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_list/core/config/router/app_router.dart';
import 'package:product_list/core/config/themes/app_theme.dart';
import 'package:product_list/core/constants/app_constants.dart';
import 'package:product_list/core/constants/device_constants.dart';
import 'package:product_list/core/constants/resources/styles.dart';

class HandleApp extends StatefulWidget {
  @override
  HandleAppState createState() => HandleAppState();

  const HandleApp({
    super.key,
  });
}

class HandleAppState extends State<HandleApp> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('en')],
        fallbackLocale: const Locale('en'),
        child: ScreenUtilInit(
          designSize: const Size(
            DeviceConstants.designDeviceWidth,
            DeviceConstants.designDeviceHeight,
          ),
          builder: (context, child) => MaterialApp(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRouter.home,
            localizationsDelegates: context.localizationDelegates,
            theme: ThemeData(
              primaryColor: AppTheme.getInstance().primaryColor,
              dialogBackgroundColor: AppTheme.getInstance().secondaryColor,
              scaffoldBackgroundColor:
                  AppTheme.getInstance().screenBackGroundColor,
              cupertinoOverrideTheme: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: AppTextStyle.regularText.copyWith(
                    color: AppTheme.getInstance().headingTextColor,
                  ),
                ),
              ),
              // splashColor: Colors.transparent,
            ),
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            builder: EasyLoading.init(),
          ),
        ),
      ),
    );
  }
}
