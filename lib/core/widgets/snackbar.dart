import 'package:starter_kit_ipp/core/config/colors.dart';
import 'package:starter_kit_ipp/core/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SnackBarType {
  error,
  success,
  danger,
  info,
  warning;
}

void showSnackBar({
  required BuildContext builderContext,
  Function? onPressed,
  required SnackBarType type,
  required String message,
  required String title,
  required IconData? leadingIcon,
  required IconData? tailingIcon,
}) {
  late SnackBar snackBar;
  if (type == SnackBarType.warning) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            height: 44.w,
            width: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFD97541),
            ),
            child: Icon(
              leadingIcon ?? Icons.warning_amber_outlined,
              size: 26,
              color: CColor.brand50,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: builderContext.textTheme.titleMedium?.copyWith(
                    color: CColor.brand50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: CColor.warning),
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: CColor.ac1,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => CColor.brand50),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.danger) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            height: 44.w,
            width: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC14444),
            ),
            child: Icon(
              leadingIcon ?? Icons.warning_amber_outlined,
              size: 26,
              color: CColor.brand50,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: builderContext.textTheme.titleMedium?.copyWith(
                    color: CColor.brand50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: CColor.ac3,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => CColor.brand50),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.success) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            height: 44.w,
            width: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF168016),
            ),
            child: Icon(
              leadingIcon ?? Icons.warning_amber_outlined,
              size: 26,
              color: CColor.brand50,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: builderContext.textTheme.titleMedium?.copyWith(
                    color: CColor.brand50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: CColor.positive,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => CColor.brand50),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.error) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.error_outline,
            size: 26,
            color: CColor.danger,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: builderContext.textTheme.bodyLarge
                  ?.copyWith(color: CColor.danger, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: CColor.danger),
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => CColor.danger),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.info) {
    snackBar =  SnackBar(
      content: Row(
        children: [
          Container(
            height: 44.w,
            width: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CColor.brand700,
            ),
            child: Icon(
              leadingIcon ?? Icons.warning_amber_outlined,
              size: 26,
              color: CColor.brand50,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: builderContext.textTheme.titleMedium?.copyWith(
                    color: CColor.brand50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: CColor.brand,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => CColor.brand50),
        onPressed: () => onPressed,
      ),
    );
  }

  ScaffoldMessenger.of(builderContext)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
