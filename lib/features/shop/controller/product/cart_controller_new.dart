import 'package:ecommerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/cart_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartControllerNew extends GetxController {
  static CartControllerNew get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// **🛒 Thêm sản phẩm vào giỏ hàng**
  Future<void> addToCart(
      String userId, ProductModel product, int quantity) async {
    try {
      var cartRef = _db.collection('Users').doc(userId).collection('cart');

      // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
      var existingItem =
          await cartRef.where('CartId', isEqualTo: product.id).limit(1).get();

      if (existingItem.docs.isNotEmpty) {
        // Nếu sản phẩm đã có, cập nhật số lượng
        String docId = existingItem.docs.first.id;
        await cartRef.doc(docId).update({
          'Quantity': existingItem.docs.first['Quantity'] + quantity,
        });
      } else {
        // Nếu chưa có, thêm mới
        CartModel newCart = CartModel(
          cartId: product.id,
          products: [product],
          quantity: quantity,
          total: product.price * quantity,
        );
        await cartRef.add(newCart.toJson());
      }
    } catch (e) {
      print('Lỗi khi thêm vào giỏ hàng: $e');
      rethrow;
    }
  }

  /// **📦 Lấy danh sách giỏ hàng**
  Future<List<CartModel>> getCart(String userId) async {
    try {
      var cartRef = _db.collection('Users').doc(userId).collection('cart');
      var snapshot = await cartRef.get();

      return snapshot.docs.map((doc) => CartModel.fromSnapshot(doc)).toList();
    } catch (e) {
      print('Lỗi khi lấy giỏ hàng: $e');
      rethrow;
    }
  }

  /// **🔄 Cập nhật số lượng sản phẩm trong giỏ hàng**
  Future<void> updateCartItemQuantity(
      String userId, String cartId, int newQuantity) async {
    try {
      var cartRef = _db.collection('Users').doc(userId).collection('cart');

      await cartRef.doc(cartId).update({'Quantity': newQuantity});
    } catch (e) {
      print('Lỗi khi cập nhật số lượng: $e');
      rethrow;
    }
  }

  /// **🗑 Xóa sản phẩm khỏi giỏ hàng**
  Future<void> removeFromCart(String userId, String cartId) async {
    try {
      var cartRef = _db.collection('Users').doc(userId).collection('cart');

      await cartRef.doc(cartId).delete();
    } catch (e) {
      print('Lỗi khi xóa sản phẩm khỏi giỏ hàng: $e');
      rethrow;
    }
  }

  /// **🗑 Xóa toàn bộ giỏ hàng**
  Future<void> clearCart(String userId) async {
    try {
      var cartRef = _db.collection('Users').doc(userId).collection('cart');

      var cartItems = await cartRef.get();
      for (var doc in cartItems.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print('Lỗi khi xóa toàn bộ giỏ hàng: $e');
      rethrow;
    }
  }
}
