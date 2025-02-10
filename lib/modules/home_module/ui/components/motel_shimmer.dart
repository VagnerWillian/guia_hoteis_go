import 'package:flutter/material.dart';

import '../../../../_shared/_shared.dart';

class MotelCardShimmer extends StatelessWidget {
  const MotelCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCircleShimmer(size: 35),
            SizedBox(width: 20),
            Expanded(child: CustomRectShimmer(height: 70)),
          ],
        ),
        SizedBox(height: 20),
        CustomRectShimmer(height: 300),
        SizedBox(height: 5),
        CustomRectShimmer(height: 70),
        SizedBox(height: 5),
        CustomRectShimmer(height: 100),
        SizedBox(height: 5),
        CustomRectShimmer(height: 100),
        SizedBox(height: 5),
        CustomRectShimmer(height: 100),
        SizedBox(height: 50),
      ],
    );
  }
}
