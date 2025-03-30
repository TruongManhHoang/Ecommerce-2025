import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';

class FavouritesRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> addToFavourites(String userId, ProductModel productModel) async {
    await _db
        .collection('Users')
        .doc(userId)
        .collection('favourites')
        .doc(productModel.id)
        .set(productModel.toJson());
  }

  Future<void> removeFromFavourites(
      String userId, ProductModel productModel) async {
    await _db
        .collection('Users')
        .doc(userId)
        .collection('favourites')
        .doc(productModel.id)
        .delete();
  }

  Future<bool> isFavourite(String userId, ProductModel productModel) async {
    final doc = await _db
        .collection('Users')
        .doc(userId)
        .collection('favourites')
        .doc(productModel.id)
        .get();
    return doc.exists;
  }

  Future<List<ProductModel>> getFavouriteProducts(String userId) async {
    final snapshot = await _db
        .collection('Users')
        .doc(userId)
        .collection('favourites')
        .get();

    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }
}
