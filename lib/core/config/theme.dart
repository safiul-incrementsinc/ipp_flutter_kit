import 'package:starter_kit_ipp/core/config/colors.dart';
import 'package:starter_kit_ipp/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

/// a [Singleton] class that hold our project theming info
@singleton
class AppTheme {
  /// getter for light theme
  ThemeData get lightTheme {
    final baseTheme = ThemeData.light();

    final colorScheme = baseTheme.colorScheme.copyWith(
      primary: CColor.primary,
      onPrimary: Colors.white,
      secondary: CColor.info,
      background: Colors.white,
      onSecondary: Colors.white,
      error: CColor.danger,
      surfaceTint: Colors.white,
    );

    return baseTheme.copyWith(
      useMaterial3: true,
      colorScheme: colorScheme,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black, fontSize: 14.r),
        contentPadding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
        prefixIconColor: const Color(0xff6C7E8B),
        suffixIconColor: const Color(0xff6C7E8B),
        filled: true,
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CColor.st3),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        enabledBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: CColor.st3),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        errorBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(color: CColor.danger),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        hintStyle: TextStyle(
          color: const Color(0xffBEBEBE),
          fontSize: 14.r,
          height: 1.42.h,
        ),
        fillColor: Colors.white,
        suffixStyle: TextStyle(
          fontSize: 16.r,
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: Border.all(color: Colors.transparent),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.white,
        toolbarHeight: 70.h,
        elevation: 2,
        shadowColor: Colors.black.withAlpha(40),
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: CColor.primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: CColor.brand800,
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: TabAlignment.start,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
        unselectedLabelColor: CColor.st1,
        labelStyle: TextStyle(
          color: CColor.brand800,
          fontWeight: FontWeight.w500,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.white),
        checkColor: MaterialStateProperty.all(CColor.primary),
        side: BorderSide(
          color: CColor.primary,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: CColor.primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(color: CColor.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(buttonBorderRadius.r),
            ),
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        actionTextColor: Colors.red,
      ),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.white,
        dayOverlayColor: MaterialStatePropertyAll(Colors.white),
      ),
      dialogBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: CColor.disable,
          disabledForegroundColor: Colors.white,
          foregroundColor: CColor.primary,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(buttonBorderRadius.r),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          disabledForegroundColor: CColor.disableText,
          foregroundColor: CColor.primary,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(buttonBorderRadius.r),
            ),
            side: BorderSide(color: CColor.primary),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          disabledBackgroundColor: CColor.disable,
          disabledForegroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(buttonBorderRadius.r),
            ),
          ),
        ),
      ),
      cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        color: Colors.white,
        shadowColor: CColor.st1.withOpacity(0.05),
      ),
      iconTheme: const IconThemeData(
        weight: 300,
      ),
      dividerTheme: const DividerThemeData(
        color: CColor.sc2,
        thickness: 1.0,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        unselectedLabelStyle: TextStyle(color: CColor.text),
        selectedLabelStyle:
            TextStyle(color: CColor.primary, fontWeight: FontWeight.bold),
        backgroundColor: CColor.backgroundColor,
        selectedItemColor: CColor.primary,
        showSelectedLabels: false,
        unselectedItemColor: CColor.text,
      ),
      sliderTheme: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.r,
          color: CColor.text,
          height: 1.25.h,
        ),
        displayMedium: TextStyle(
          fontSize: 45.r,
          color: CColor.text,
          height: 1.15.h,
        ),
        displaySmall: TextStyle(
          fontSize: 36.r,
          color: CColor.text,
          height: 1.22.h,
        ),
        headlineLarge: TextStyle(
          fontSize: 32.r,
          color: CColor.text,
          height: 1.25.h,
        ),
        headlineMedium: TextStyle(
          fontSize: 28.r,
          color: CColor.text,
          height: 1.28.h,
        ),
        headlineSmall: TextStyle(
          fontSize: 24.r,
          color: CColor.text,
          height: 1.33.h,
        ),
        titleLarge: TextStyle(
          fontSize: 20.r,
          color: CColor.text,
          height: 1.2.h,
        ),
        titleMedium: TextStyle(
          fontSize: 22.r,
          color: CColor.text,
          height: 1.27.h,
        ),
        titleSmall: TextStyle(
          fontSize: 16.r,
          color: CColor.text,
          height: 1.5.h,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.r,
          color: CColor.text,
          height: 1.2.h,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.r,
          color: CColor.text,
          height: 1.42.h,
        ),
        bodySmall: TextStyle(
          fontSize: 12.r,
          color: CColor.text,
          height: 1.33.h,
        ),
        labelLarge: TextStyle(
          fontSize: 14.r,
          color: CColor.text,
        ),
        labelMedium: TextStyle(
          fontSize: 12.r,
          color: CColor.text,
        ),
        labelSmall:
            TextStyle(fontSize: 11.r, color: CColor.text, letterSpacing: 0),
      ),
      timePickerTheme: TimePickerThemeData(
        dayPeriodColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? CColor.brand
              : Colors.white,
        ),
        dayPeriodTextColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? CColor.brand50
              : const Color(0xffbebebe),
        ),
        dialBackgroundColor: CColor.brand50,
        dialTextColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? CColor.brand50
              : CColor.brand,
        ),
        hourMinuteColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? CColor.brand
              : CColor.brand50,
        ),
        hourMinuteTextColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? CColor.brand50
              : CColor.brand100,
        ),
        dayPeriodBorderSide: const BorderSide(color: Color(0xffbebebe)),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        extendedSizeConstraints:
            const BoxConstraints.tightFor(height: 56, width: 280),
      ),
      dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Space.md)),
        ),
      ),
      unselectedWidgetColor: CColor.disableText,
      primaryColor: CColor.primary,
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(CColor.primary),
      ),
    );
  }
}
