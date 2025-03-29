import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_model.dart';

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

  /// **CartModel mặc định (Rỗng)**
  static CartModel empty() => CartModel(
        cartId: '',
        products: [],
        quantity: 0,
        total: 0,
      );

  /// **Chuyển CartModel thành JSON để lưu vào Firestore**
  Map<String, dynamic> toJson() {
    return {
      'CartId': cartId,
      'Products': products.map((e) => e.toJson()).toList(),
      'Quantity': quantity,
      'Total': total,
    };
  }

  /// **Lấy dữ liệu từ Firestore (DocumentSnapshot)**
  factory CartModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) return CartModel.empty();

    return CartModel(
      cartId: doc.id,
      quantity: data['Quantity'] ?? 0,
      total: (data['Total'] as num?)?.toDouble() ?? 0.0,
      products: data['Products'] != null
          ? (data['Products'] as List<dynamic>)
              .map((e) => ProductModel.fromQuerySnapshot(e))
              .toList()
          : [],
    );
  }
}
