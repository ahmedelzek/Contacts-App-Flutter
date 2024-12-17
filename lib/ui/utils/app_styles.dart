import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppStyles {
  static TextStyle textContactItemStyle = const TextStyle(
      height: 1.5,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.primary);

  static TextStyle userNameTextStyle = const TextStyle(
      color: AppColors.primary, fontSize: 17, fontWeight: FontWeight.bold);

  static TextStyle textStylesInBottomSheet = const TextStyle(
      color: AppColors.accent, fontSize: 17, fontWeight: FontWeight.w500);
}
