import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/features/shop/models/review_model.dart';
import 'package:get/get.dart';

class ReviewsRepository extends GetxController {
  static ReviewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  ///Get all reviews related to current User
  Future<List<ReviewModel>> fetchUserReviews() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes.';
      }

      final result = await _db
          .collection('reviews')
          .where('userId', isEqualTo: userId)
          .get();
      return result.docs
          .map((documentSnapshot) => ReviewModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching Review information. Try again later.';
    }
  }

  Future<List<ReviewModel>> fetchProductReviews(String productId) async {
    try {
      final result = await _db.collection('reviews').get();

      // Lọc client-side: tìm review chứa productId đó trong danh sách items
      final filteredReviews = result.docs.where((doc) {
        final items = doc['items'] as List<dynamic>;
        return items.any((item) => item['productId'] == productId);
      }).toList();

      return filteredReviews
          .map((snapshot) => ReviewModel.fromSnapshot(snapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching Review information. Try again later.';
    }
  }

  ///Store new user Review
  Future<void> saveReview(
    ReviewModel review,
  ) async {
    try {
      await _db.collection('reviews').add(review.toJson());
    } catch (e) {
      throw 'Something went wrong while saving Review information. Try again later.';
    }
  }
}
