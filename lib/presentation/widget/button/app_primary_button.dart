import 'package:flutter/material.dart';
import 'package:product_list/core/config/themes/app_theme.dart';
import 'package:product_list/core/constants/resources/dimens.dart';
import 'package:product_list/core/constants/resources/styles.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    this.onTap,
    required this.title,
    this.style,
    this.hPadding,
    this.color,
  });
  final void Function()? onTap;
  final String title;
  final TextStyle? style;
  final double? hPadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.d60,
      margin: EdgeInsets.symmetric(
        horizontal: hPadding ?? Dimens.d16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimens.d16,
        ),
        color: color ?? AppTheme.getInstance().primaryColor,
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: style ??
                AppTextStyle.mediumText.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                ),
          ),
        ),
      ),
    );
  }
}
