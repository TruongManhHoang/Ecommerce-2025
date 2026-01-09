import 'package:ecommerce_app/common/widgets/shimmer/comment_shimmer.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/features/shop/controller/product/review_controller.dart';
import 'package:ecommerce_app/features/shop/screens/review/widgets/card_review_item.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MyReviewScreen extends StatelessWidget {
  const MyReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewController = ReviewController.instance;
    final userController = UserController.instance;
    var dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reviews'),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: dark ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            final reviews = reviewController.reviewsList;
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

            return ListView.builder(
              itemCount: reviewController.reviewsList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final review = reviewController.reviewsList[index];
                return FutureBuilder(
                  future: userController.fetchUserById(review.userId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const TCommentShimmer();
                    }

                    if (!snapshot.hasData) {
                      return const Text('No reviews yet!');
                    }

                    final user = snapshot.data!;
                    return CardReviewItem(
                      dark: dark,
                      reviewModel: review,
                      userModel: user,
                    );
                  },
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
