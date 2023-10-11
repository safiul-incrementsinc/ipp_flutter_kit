import 'package:starter_kit_ipp/core/utils/extention.dart';
import 'package:starter_kit_ipp/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

/// page not found page
class PageNotFound extends StatelessWidget {
  /// page not found page
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/404.json'),
            Button(
              buttonSize: ButtonSize.sm,
              buttonColor: ButtonColor.warning,
              onPressed: () {
                context.go('/home');
              },
              child: Text(
                'Go Back To Home',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
