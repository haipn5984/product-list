import 'package:flutter/material.dart';

const colorPrimary = Color(0xff30449E);
const colorTextHeading = Color(0xFF3A3A44);
const colorBackgroundScreen = Color(0xffffffff);
const colorText = Color(0xff616169);

///=========== Using to make change app theme ================================
abstract class AppColor {
  Color get primaryColor;
  Color get secondaryColor;
  Color get screenBackGroundColor;
  Color get headingTextColor;
  Color get bodyTextColor;
}

class LightApp extends AppColor {
  @override
  Color get headingTextColor => colorTextHeading;

  @override
  Color get primaryColor => colorPrimary;

  @override
  Color get screenBackGroundColor => colorBackgroundScreen;

  @override
  Color get secondaryColor => Colors.white;

  @override
  Color get bodyTextColor => colorText;
}

class DarkApp extends AppColor {
  @override
  // TODO: implement headingTextColor
  Color get headingTextColor => throw UnimplementedError();

  @override
  // TODO: implement primaryColor
  Color get primaryColor => throw UnimplementedError();

  @override
  // TODO: implement screenBackGroundColor
  Color get screenBackGroundColor => throw UnimplementedError();

  @override
  // TODO: implement secondaryColor
  Color get secondaryColor => throw UnimplementedError();

  @override
  // TODO: implement bodyTextColor
  Color get bodyTextColor => throw UnimplementedError();
}
