import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/reviews/reviews_repository.dart';
import 'package:ecommerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  static ReviewController get instance => Get.find();

  final reviewsRepository = Get.put(ReviewsRepository());
  final cartController = CartController.instance;
  final isLoading = false.obs;
  final reviews = <ReviewModel>[].obs;
  final reviewsList = <ReviewModel>[].obs;

  @override
  void onInit() {
    fetchUserReviews();
    super.onInit();
  }

  void fetchUserReviews() async {
    try {
      isLoading.value = true;
      final userReviews = await reviewsRepository.fetchUserReviews();
      reviewsList.assignAll(userReviews);
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchProductReviews(String productId) async {
    try {
      isLoading.value = true;
      final productReviews =
          await reviewsRepository.fetchProductReviews(productId);
      reviews.assignAll(productReviews);
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }

  void saveReview({required double rating, required String comment}) async {
    try {
      isLoading.value = true;
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final reviewModel = ReviewModel(
        id: UniqueKey().toString(),
        userId: userId,
        items: cartController.cartItems.toList(),
        rating: rating,
        comment: comment,
        reviewDate: DateTime.now(),
      );

      await reviewsRepository.saveReview(reviewModel);
      reviews.add(reviewModel);
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }
}
