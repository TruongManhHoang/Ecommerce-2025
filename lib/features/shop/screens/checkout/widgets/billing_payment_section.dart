import 'package:ecommerce_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(children: [
      const TSectionHeading(
        title: 'Payment Method',
        showActionButton: false,
      ),
      const SizedBox(
        height: TSizes.spaceBtwItems / 2,
      ),
      Row(
        children: [
          TRoundedContainer(
            width: 60,
            height: 55,
            backgroundColor: dark ? TColors.light : TColors.white,
            padding: const EdgeInsets.all(TSizes.sm),
            child: const Image(
              image: AssetImage(TImages.stripe),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems / 2,
          ),
          Text(
            'Stripe',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    ]);
  }
}
