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
        .then((value) => null)
        .catchError((error) => null);
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
        .then((value) => null)
        .catchError((error) => null);
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
        .catchError((error) => <CartItemModel>[]);
  }
}
