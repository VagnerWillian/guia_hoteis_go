import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomRectShimmer extends StatelessWidget {
  final double height;
  const CustomRectShimmer({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.withValues(alpha: .2),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
      ),
    );
  }
}

class CustomCircleShimmer extends StatelessWidget {
  final double size;
  const CustomCircleShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.withValues(alpha: .2),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey,
        ),
      ),
    );
  }
}
