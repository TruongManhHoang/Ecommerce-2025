abstract class CartRepository {
  Future<void> addProductToCart(String productId);
  Future<void> removeProductFromCart(String productId);
  Future<void> clearCart();
  Future<List<String>> getCartProducts();
}
