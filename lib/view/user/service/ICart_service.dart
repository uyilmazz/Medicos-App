import '../../pharmacy/model/order.dart';
import '../model/user_cart.dart';

abstract class ICartService {
  Future<List<CartItem>?> getCart(String userId);
  Future<bool> addProductInCart(String productId, String userId);
  Future<bool> decrementProductFromCart(String productId, String userId);
  Future<bool> addOrder(Order item);
  Future<bool> clearCart(String userId);
}
