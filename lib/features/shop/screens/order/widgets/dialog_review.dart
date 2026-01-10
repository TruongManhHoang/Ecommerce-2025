import 'package:ecommerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controller/product/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DialogReview {
  static void showReviewDialog(BuildContext context) {
    final TextEditingController commentController = TextEditingController();
    final reviewController = Get.put(ReviewController());
    final cartController = CartController.instance;
    double rating = 0.0;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Viết đánh giá',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 16),
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (newRating) =>
                        setState(() => rating = newRating),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: commentController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Nhập nội dung đánh giá...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (rating == 0 ||
                          commentController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Vui lòng đánh giá và nhập bình luận'),
                          ),
                        );
                        return;
                      }

                      reviewController.saveReview(
                        rating: rating,
                        comment: commentController.text.trim(),
                      );
                      cartController.clearCart();

                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.send),
                    label: const Text('Gửi đánh giá'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
