import 'package:ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:ecommerce_app/common/widgets/product/ratings/rating_indicator.dart';
import 'package:ecommerce_app/features/personalization/models/userModel.dart';
import 'package:ecommerce_app/features/shop/models/cart_item_model.dart';
import 'package:ecommerce_app/features/shop/models/review_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard(
      {super.key,
      required this.reviewModel,
      required this.userModel,
      this.productId,
      required this.cartItemModel});
  final productId;
  final ReviewModel reviewModel;
  final CartItemModel cartItemModel;
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: dark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: dark ? Colors.black54 : Colors.grey[300]!,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TCircularImage(
                    image: userModel.profilePicture,
                    width: 50,
                    height: 60,
                    padding: 0,
                    isNetworkImage: true,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text(
                    '${userModel.firstName} ${userModel.lastName}',
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),

          ///Review
          Row(
            children: [
              TRatingBarIndicator(rating: reviewModel.rating),
              const Gap(5),
              Text(
                '${reviewModel.rating}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                THelperFunctions.getFormattedDate(reviewModel.reviewDate),
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),

          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          ReadMoreText(
            reviewModel.comment,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimExpandedText: 'show less',
            trimCollapsedText: 'show more',
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: TColors.primary),
            lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: TColors.primary),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: dark ? Colors.grey[700] : Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    '${cartItemModel.image}',
                    fit: BoxFit.contain,
                  ),
                ),
                Gap(10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${cartItemModel.title}'),
                    Text.rich(TextSpan(
                        children: (cartItemModel.selectedVariation ?? {})
                            .entries
                            .map((e) => TextSpan(children: [
                                  TextSpan(
                                      text: ' ${e.key} ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  TextSpan(
                                      text: '${e.value} ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ]))
                            .toList()))
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
