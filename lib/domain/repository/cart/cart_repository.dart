import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/cart_item_model.dart';

class CartRepository {
  final _db = FirebaseFirestore.instance;
  Future<void> addProductToCart(String userId, CartItemModel product) {
    return _db
        .collection('Users')
        .doc(userId)
        .collection('cart')
        .doc(product.productId)
        .set(product.toJson())
        .then((value) => print("Product Added to Cart"))
        .catchError((error) => print("Failed to add product: $error"));
  }

  Future<void> removeProductFromCart(
    String userId,
    String productId,
  ) {
    return _db
        .collection('Users')
        .doc(userId)
        .collection('cart')
        .doc(productId)
        .delete()
        .then((value) => print("Product Removed from Cart"))
        .catchError((error) => print("Failed to remove product: $error"));
  }

  Future<List<CartItemModel>> getCartProducts(String userId) {
    return _db
        .collection('Users')
        .doc(userId)
        .collection('cart')
        .get()
        .then((snapshot) => snapshot.docs
            .map((doc) => CartItemModel.fromSnapshot(doc))
            .toList())
        .catchError((error) => print("Failed to get cart products: $error"));
  }
}
