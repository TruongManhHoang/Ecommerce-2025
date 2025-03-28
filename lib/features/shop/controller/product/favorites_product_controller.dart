import 'package:ecommerce_app/data/repositories/favorites/favorites_repository.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavouritesProductController extends GetxController {
  static FavouritesProductController get instance => Get.find();

  final favouritesRepo = FavouritesRepository();
  final _auth = FirebaseAuth.instance;

  final RxSet<ProductModel> favourites = <ProductModel>{}.obs;

  @override
  void onInit() {
    loadUserFavourites();
    super.onInit();
  }

  Future<void> loadUserFavourites() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    final products = await favouritesRepo.getFavouriteProducts(userId);
    favourites.assignAll(products);
  }

  bool isFavourite(String productId) {
    return favourites.any((product) => product.id == productId);
  }

  void toggleFavourite(ProductModel productModel) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    if (isFavourite(productModel.id)) {
      await favouritesRepo.removeFromFavourites(userId, productModel);
      favourites.removeWhere((product) => product.id == productModel.id);
      TLoaders.customToast(message: 'Removed from Wishlist');
    } else {
      await favouritesRepo.addToFavourites(userId, productModel);
      favourites.add(productModel);
      TLoaders.customToast(message: 'Added to Wishlist');
    }
  }

  Future<List<ProductModel>> getFavouriteProducts() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return [];
    return await favouritesRepo.getFavouriteProducts(userId);
  }
}
