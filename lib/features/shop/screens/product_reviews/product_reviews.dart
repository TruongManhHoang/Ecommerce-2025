import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/shimmer/comment_shimmer.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/features/personalization/models/user_model.dart';
import 'package:ecommerce_app/features/shop/controller/product/review_controller.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/user_review_cart.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProductReviewScreen extends StatelessWidget {
  ProductReviewScreen({
    super.key,
    this.productId,
  });
  final String? productId;
  final reviewController = ReviewController.instance;
  final userController = UserController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///appbar
      appBar: const TAppBar(
        title: Text('Review & Ratings'),
        showBackArrow: true,
      ),

      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(() {
            final reviews = reviewController.reviews;

            if (reviews.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    'No reviews yet!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///User Reviews List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    final review = reviews[index];

                    /// Lấy ra item khớp productId
                    final matchedItem = review.items.firstWhere(
                      (item) => item.productId == productId,
                    );

                    return FutureBuilder<UserModel>(
                      future: userController.fetchUserById(review.userId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const TCommentShimmer();
                        }

                        if (!snapshot.hasData) {
                          return const Text('Không thể tải người dùng');
                        }

                        final user = snapshot.data!;
                        return Column(
                          children: [
                            UserReviewCard(
                              cartItemModel: matchedItem,
                              productId: productId,
                              reviewModel: review,
                              userModel: user,
                            ),
                            const Gap(TSizes.spaceBtwSections)
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
