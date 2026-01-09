import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TCommentShimmer extends StatelessWidget {
  const TCommentShimmer({super.key, this.itemCount = 2});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            children: [
              TShimmerEffect(width: double.infinity, height: 200),
              Gap(TSizes.spaceBtwItems)
            ],
          );
        });
  }
}
