import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePictureWithProgressBar extends StatelessWidget {
  const ProfilePictureWithProgressBar(
      {super.key,
      this.size,
      required this.imageUrl,
      this.strokeWidth,
      required this.progressValue,});

  // set a size of the image
  final double? size;

  //set progress stroke size
  final double? strokeWidth;

  // progress value
  final double progressValue;

  //image url
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // image part ------------------------
        SizedBox(
          width: size ?? 120.r,
          height: size ?? 120.r,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.person),
            ),
          ),
        ),
        // indicator part -------------
        SizedBox(
          height: size != null ? size! + 2 : 122.r,
          width: size != null ? size! + 2 : 122.r,
          child: Transform.flip(
            flipX: true,
            child: CircularProgressIndicator(
              value: progressValue,
              strokeWidth: strokeWidth ?? 5.0,
            ),
          ),
        ),
      ],
    );
  }
}
