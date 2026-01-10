import 'package:ecommerce_app/common/widgets/product/ratings/rating_indicator.dart';
import 'package:ecommerce_app/features/personalization/models/user_model.dart';
import 'package:ecommerce_app/features/shop/models/review_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class CardReviewItem extends StatelessWidget {
  const CardReviewItem({
    super.key,
    required this.dark,
    required this.reviewModel,
    required this.userModel,
  });

  final bool dark;
  final ReviewModel reviewModel;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      userModel.profilePicture,
                      width: 35,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${userModel.lastName} ${userModel.firstName}'),
                      Row(
                        children: [
                          TRatingBarIndicator(
                            rating: reviewModel.rating,
                          ),
                          const Gap(5),
                          Text(
                            reviewModel.rating.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              ReadMoreText(
                reviewModel.comment,
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: 'show less',
                trimCollapsedText: 'show more',
                moreStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary),
                lessStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary),
              ),
              Text(THelperFunctions.getFormattedDate(reviewModel.reviewDate)),
              const Gap(5),
              ListView.builder(
                itemCount: reviewModel.items.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = reviewModel.items[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: dark ? Colors.grey[500] : Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.network(
                                '${item.image}',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title),
                                Text.rich(TextSpan(
                                    children: (item.selectedVariation ?? {})
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
                            )),
                          ],
                        ),
                      ),
                      const Gap(TSizes.spaceBtwItems),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        const Gap(TSizes.spaceBtwItems),
      ],
    );
  }
}
