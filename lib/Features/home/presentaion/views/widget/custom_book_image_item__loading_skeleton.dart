import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBookImageItemLoadingSkeleton extends StatelessWidget {
  const CustomBookImageItemLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Shimmer.fromColors(
          baseColor: const Color(0xFF2A1632),
          highlightColor: const Color(0xFF4A2B52),
          child: Container(color: Colors.white),
        ),
      ),
    );
  }
}
