import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/cart_model.dart';
import 'package:get/get.dart';

class CartRepository extends GetxController {
  static CartRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<void> addToCart(String userId, CartModel cartModel) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('cart')
          .add(cartModel.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
