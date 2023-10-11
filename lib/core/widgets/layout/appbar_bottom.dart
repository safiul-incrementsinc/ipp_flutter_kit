import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:starter_kit_ipp/core/config/colors.dart';

/// [AppBarBottom]
class AppBarBottom extends HookWidget {
  final Widget child;
/// a [PreferredSize] widget that make project easy. noting else
  const AppBarBottom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(0.0, 60.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.only(left: 16),
        decoration: const BoxDecoration(
          color: CColor.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: child,
      ),
    );
  }
}
