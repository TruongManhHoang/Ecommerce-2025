import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/cart_item_model.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';

class ReviewModel {
  final String id;
  final String userId;
  final List<CartItemModel> items;
  final double rating;
  final String comment;
  final DateTime reviewDate;

  ReviewModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.rating,
    required this.comment,
    required this.reviewDate,
  });

  String get formattedReviewDate =>
      THelperFunctions.getFormattedDate(reviewDate);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'rating': rating,
      'comment': comment,
      'reviewDate': reviewDate,
    };
  }

  factory ReviewModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ReviewModel(
      id: data['id'] as String,
      userId: data['userId'] as String,
      items: (data['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      rating: (data['rating'] as num).toDouble(),
      comment: data['comment'] as String,
      reviewDate: (data['reviewDate'] as Timestamp).toDate(),
    );
  }
}
