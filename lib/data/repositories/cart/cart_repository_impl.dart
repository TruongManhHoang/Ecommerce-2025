import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/domain/repository/cart/cart_repository.dart';
import 'package:ecommerce_app/features/shop/models/cart_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

// class CartRepositoryImpl implements CartRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   @override
//   Future<void> addProductToCart(String userId, CartItemModel product) async {
//     await _firestore
//         .collection('Users')
//         .doc(userId)
//         .collection('cart')
//         .doc(product.productId)
//         .set(product.toJson())
//         .then((value) => print("Product Added to Cart"))
//         .catchError((error) => print("Failed to add product: $error"));
//   }

//   @override
//   Future<void> clearCart() async {}

//   @override
//   Future<List<CartItemModel>> getCartProducts(String userId) async {
//     final snapshot = await _firestore
//         .collection('Users')
//         .doc(userId)
//         .collection('cart')
//         .get();
//     return snapshot.docs.map((doc) => CartItemModel.fromSnapshot(doc)).toList();
//   }

//   @override
//   Future<void> removeProductFromCart(String productId) {
//     // TODO: implement removeProductFromCart
//     throw UnimplementedError();
//   }
// }
