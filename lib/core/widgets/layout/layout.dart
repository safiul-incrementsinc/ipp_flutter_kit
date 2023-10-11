import 'package:starter_kit_ipp/core/config/colors.dart';
import 'package:starter_kit_ipp/core/config/custom_icons_icons.dart';
import 'package:starter_kit_ipp/core/snackbar/cubit/snack_bar_cubit.dart';
import 'package:starter_kit_ipp/core/widgets/layout/refresh_indicator.dart';
import 'package:starter_kit_ipp/core/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutAppBar {
  final bool? centerTitle;
  final Widget? flexibleSpace;
  final Widget? appBarTitle;
  final Widget? bottomAppBar;
  final Widget? drawer;
  final String? flexibleSpaceBarTitle;
  final List<Widget>? actions;
  final double? expandedHeight;
  final Color? appbarColor;
  final BorderRadiusGeometry? borderRadius;

  AppbarLeading? leading;

  LayoutAppBar({
    this.centerTitle = false,
    this.bottomAppBar,
    this.flexibleSpace,
    this.borderRadius,
    this.drawer,
    this.appbarColor,
    this.appBarTitle,
    this.flexibleSpaceBarTitle,
    this.actions,
    this.expandedHeight,
    this.leading,
  });
}

class AppbarLeading {
  bool? isLeading;
  Function()? onTap;
  Widget? child;

  AppbarLeading({this.isLeading = true, this.onTap, this.child});
}

class Layout extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final LayoutAppBar? appBar;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Future Function()? onRefresh;
  final bool? isScrollPagination;
  final SliverPersistentHeaderDelegate? sliverPersistentHeaderDelegate;

  const Layout({
    super.key,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    required this.body,
    this.backgroundColor = Colors.white,
    this.onRefresh,
    this.isScrollPagination = false,
    this.sliverPersistentHeaderDelegate,
  });

  @override
  Widget build(BuildContext context) {
    return _baseLayout(context);
  }

  Widget _baseLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            body: _customScrollView(context),
            drawer: appBar?.drawer,
          ),
        ),
      ),
    );
  }

  Widget _customScrollView(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        if (appBar != null)
          SliverAppBar(
            forceElevated: true,
            centerTitle: appBar?.centerTitle,
            backgroundColor: appBar?.flexibleSpace != null
                ? Colors.white
                : appBar?.appbarColor,
            floating: true,
            pinned: true,
            shape: ContinuousRectangleBorder(
              borderRadius: appBar?.borderRadius ?? BorderRadius.zero,
            ),
            snap: appBar?.bottomAppBar != null,
            automaticallyImplyLeading: false,
            title: appBar?.appBarTitle,
            leading:
                appBar?.leading == null || appBar?.leading?.isLeading == true
                    ? appBar?.leading?.child ??
                        IconButton(
                          onPressed: appBar?.leading?.onTap ??
                              () {
                                Navigator.pop(context);
                              },
                          icon: Icon(
                            CustomIcons.arrow_back_ios_new,
                            color: CColor.primary.shade800,
                            size: 26,
                          ),
                        )
                    : null,
            expandedHeight: appBar?.expandedHeight ??
                (appBar?.flexibleSpace != null
                    ? 215.0
                    : appBar?.flexibleSpace == null &&
                            appBar?.bottomAppBar == null
                        ? 0
                        : 130),
            actions: appBar?.actions,
            // shape: const RoundedRectangleBorder(
            //   borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(20),
            //     bottomRight: Radius.circular(20),
            //   ),
            // ),
            flexibleSpace: appBar?.flexibleSpace ?? Container(),
            bottom: appBar?.bottomAppBar != null
                ? PreferredSize(
                    preferredSize: const Size(0, 62),
                    child: appBar!.bottomAppBar!,
                  )
                : null,
          ),
        if (sliverPersistentHeaderDelegate != null)
          SliverPersistentHeader(
            pinned: true,
            delegate: sliverPersistentHeaderDelegate!,
          ),
      ],
      body: _isRefreshWidget(context),
    );
  }

  Widget _isRefreshWidget(BuildContext context) {
    if (onRefresh != null) {
      return RefreshWidget(
        onRefresh: onRefresh,
        child: _body(context),
      );
    } else {
      return _body(context);
    }
  }

  Widget _body(BuildContext context) {
    return BlocListener<SnackBarCubit, SnackBarState>(
      listener: (_, state) {
        if (state is SnackBarLoaded) {
          showSnackBar(
            builderContext: context,
            type: state.type,
            message: state.message,
            onPressed: state.onPressed,
            title: state.title,
            leadingIcon: state.leadingIcon,
            tailingIcon: state.tailingIcon,
          );
        }
      },
      child: body,
    );
  }
}
