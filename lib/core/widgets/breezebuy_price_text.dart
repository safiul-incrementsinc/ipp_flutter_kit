import 'package:starter_kit_ipp/core/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPriceText extends StatelessWidget {
  final double price;
  late final String roundedPrice;
  late final String fraction;
  final double? gap;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? roundedPriceTextStyle;
  final TextStyle? fractionPriceTextStyle;

  CustomPriceText({
    super.key,
    required this.price,
    this.gap = 2,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.fractionPriceTextStyle,
    this.roundedPriceTextStyle,
  }) {
    roundedPrice = price.toInt().toString();
    fraction = price.toStringAsFixed(5).split('.').last.substring(0, 2);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        Text('$roundedPrice.', style: roundedPriceTextStyle),
        Text(
          fraction,
          style: fractionPriceTextStyle,
        ),
      ].withSpaceBetween(width: gap?.w),
    );
  }
}
