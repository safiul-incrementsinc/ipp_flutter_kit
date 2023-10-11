import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// [RefreshWidget]
class RefreshWidget extends StatefulWidget {
  /*final GlobalKey<RefreshIndicatorState> keyRefresh;*/

  /// widget that will wrap with refresh indicator
  final Widget child;

  /// on pull to refresh
  final Future Function()? onRefresh;

  /// pull to refresh indicator for ios and android
  const RefreshWidget({
    super.key,
    /* required this.keyRefresh,*/
    this.onRefresh,
    required this.child,
  });

  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) => Platform.isAndroid ? buildAndroidList() : buildIOSList();

  Widget buildAndroidList() => RefreshIndicator(
        /* key: widget.keyRefresh,*/
        onRefresh: widget.onRefresh ?? () async {},
        child: widget.child,
      );

  Widget buildIOSList() => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
          SliverToBoxAdapter(child: widget.child),
        ],
      );
}
