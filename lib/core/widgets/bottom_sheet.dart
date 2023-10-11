import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BBottomSheet {
  final BuildContext context;
  final Widget child;
  double? height;
  double? maxHeight;
  bool? isScrollControlled;
  bool? isBarIcon;

  BBottomSheet({
    required this.context,
    required this.child,
    this.height,
    this.maxHeight,
    this.isScrollControlled = true,
    this.isBarIcon = true,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        if (isScrollControlled!) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.pop();
            },
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: height ?? 0.6,
                minChildSize: height ?? 0.3,
                maxChildSize: maxHeight ?? 1,
                expand: false,
                builder: (context, scrollController) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      if (isBarIcon == true)
                        Icon(
                          Icons.remove,
                          color: Colors.grey[600],
                        ),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * (height ?? 0.6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0.r),
                topRight: Radius.circular(24.0.r),
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
