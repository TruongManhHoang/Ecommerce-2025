import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';

class CartModel {
  String cartId;
  List<ProductModel> products;
  int quantity;
  double total;
  CartModel({
    required this.cartId,
    required this.products,
    required this.quantity,
    required this.total,
  });
  static CartModel empty() => CartModel(
        cartId: '',
        products: [],
        quantity: 0,
        total: 0,
      );
  toJson() {
    return {
      'Products': products.map((e) => e.toJson()).toList(),
      'Quantity': quantity,
      'Total': total,
    };
  }

  factory CartModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return CartModel.empty();
    final data = document.data()!;
    return CartModel(
      cartId: document.id,
      quantity: data['Quantity'] ?? 0,
      total: data['Total'] ?? 0,
      products: data['Products']
              .map<ProductModel>((e) => ProductModel.fromQuerySnapshot(e))
              .toList() ??
          [],
    );
  }
  factory CartModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return CartModel(
      cartId: document.id,
      quantity: data['Quantity'] ?? 0,
      total: data['Total'] ?? 0,
      products: data['Products']
              .map<ProductModel>((e) => ProductModel.fromQuerySnapshot(e))
              .toList() ??
          [],
    );
  }
}
