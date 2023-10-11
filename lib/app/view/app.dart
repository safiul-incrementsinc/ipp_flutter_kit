import 'package:starter_kit_ipp/app/app_router.dart';
import 'package:starter_kit_ipp/core/config/bloc_provider.dart';
import 'package:starter_kit_ipp/core/config/colors.dart';
import 'package:starter_kit_ipp/core/config/get_it.dart';
import 'package:starter_kit_ipp/core/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [App]
class App extends StatelessWidget {
  /// starting point of our app
  /// this [StatelessWidget] will hold material app with
  /// go_router, and global blog provider. also `ScreenUtil` setup is here
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CColor.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MultiBlocProvider(
      providers: getIt<Provider>().providers,
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        builder: (BuildContext context, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: getIt<AppTheme>().lightTheme,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
