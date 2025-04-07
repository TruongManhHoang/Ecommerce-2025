import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, dynamic>? selectedVariation;

  CartItemModel({
    required this.productId,
    this.title = '',
    this.price = 0.0,
    this.image,
    required this.quantity,
    this.variationId = '',
    this.brandName,
    this.selectedVariation,
  });

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  ///Covert a CartItem to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation
    };
  }

  factory CartItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    return CartItemModel(
      productId: document.id,
      title: document.data()?['title'] ?? '',
      price: document.data()?['price']?.toDouble() ?? 0.0,
      image: document.data()?['image'],
      quantity: document.data()?['quantity']?.toInt() ?? 0,
      variationId: document.data()?['variationId'] ?? '',
      brandName: document.data()?['brandName'],
      selectedVariation: document.data()?['selectedVariation'],
    );
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      variationId: json['variationId'],
      brandName: json['brandName'],
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, String>.from(json['selectedVariation'])
          : null,
    );
  }
}
