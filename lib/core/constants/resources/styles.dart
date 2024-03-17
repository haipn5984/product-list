import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/themes/app_theme.dart';

class AppTextStyle {
  AppTextStyle._();

  /// Regular
  static final boldText = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppTheme.getInstance().bodyTextColor,
  );
  static final regularText = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppTheme.getInstance().bodyTextColor,
  );
  static final mediumText = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppTheme.getInstance().bodyTextColor,
  );
  static final lightText = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppTheme.getInstance().bodyTextColor,
  );
}
