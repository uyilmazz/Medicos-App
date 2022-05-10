import 'package:flutter/material.dart';
import 'package:medicos_app/core/init/cache/local_cache_manager.dart';
import 'package:medicos_app/view/doctor/model/appointment.dart';
import 'package:medicos_app/view/pharmacy/model/order.dart';
import 'package:medicos_app/view/user/model/user_cart.dart';
import 'package:medicos_app/view/user/service/IAuth_service.dart';
import 'package:medicos_app/view/user/service/ICart_service.dart';
import 'package:medicos_app/view/user/service/cart_service.dart';
import '../model/user.dart';
import '../service/auth_service.dart';

class UserViewModel extends ChangeNotifier {
  User? user;
  final IAuthService _authService = AuthService.instance;
  final ICartService _cartService = CartService.instance;
  final LocalCacheManager _localCacheManager = LocalCacheManager.instance;

  bool isUpcoming = true;
  List<Appointment> userAppointment = [];

  List<CartItem>? cart;
  double totalPrice = 0;
  double order = 0;
  int tax = 2;
  int discount = 3;
  int delivery = 50;

  User fakeUser = User(
      name: 'Wade Warrenn',
      address: '4517 Washington Ave. Manchester, Kentucky 39495',
      phoneNumber: '(603) 555-0123',
      email: 'abc@gmail.com',
      imageUrl: 'user_profile',
      zipCode: 27400);

  void changeAppointment(bool value) {
    isUpcoming = value;
    getAppointmentByUserId();
    notifyListeners();
  }

  Future<bool> userLogin(String email, String password) async {
    final response = await _authService.loginUser(email, password);
    if (response != null) {
      user = response;
      _localCacheManager.saveToken(user?.token ?? '');
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<bool> registerUser(
      String name, String email, String phoneNumber, String password) async {
    final response =
        await _authService.registerUser(name, email, phoneNumber, password);
    if (response != null) {
      user = response;
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<bool> verifyToken() async {
    final token = await _localCacheManager.getToken();
    final response = await _authService.verifyToken(token ?? '');
    if (response != null) {
      user = response;
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<bool> updatePassword(String newPassword) async {
    final response =
        await _authService.updatePassword(newPassword, user?.sId ?? '');
    if (response) {
      await logout();
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<bool> updateProfile(
      {String? name,
      String? email,
      String? phoneNumber,
      String? imagePath}) async {
    if (name != user?.name ||
        email != user?.email ||
        imagePath != null ||
        phoneNumber != user?.phoneNumber) {
      final response = await _authService.updateProfile(
          name, email, phoneNumber, user?.sId ?? '', imagePath);
      if (response != null) {
        user = response;
        notifyListeners();
        return true;
      }
    } else {
      return false;
    }
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    await _localCacheManager.deleteToken();
  }

  Future<void> getCart() async {
    cart = await _cartService.getCart(user?.sId ?? '');
    cartTotalPrice();
    notifyListeners();
  }

  Future<void> addProductInCart(String productId) async {
    final response =
        await _cartService.addProductInCart(productId, user?.sId ?? '');
    if (response) {
      getCart();
      cartTotalPrice();
    }
    notifyListeners();
  }

  Future<void> decrementProductFromCart(String productId) async {
    final response =
        await _cartService.decrementProductFromCart(productId, user?.sId ?? '');
    if (response) {
      getCart();
      cartTotalPrice();
    }
    notifyListeners();
  }

  Future<bool> addOrder() async {
    if (cart != null) {
      List<OrderItem> orderItems = cart!.map((cartItem) {
        return OrderItem(
            productId: cartItem.product?.id, quantity: cartItem.quantity);
      }).toList();

      Order item = Order(
          address: user?.address,
          deliveryTime: '25 minutes',
          email: user?.email,
          orderItems: orderItems,
          totalAmount: totalPrice,
          userId: user?.sId);
      final response = await _cartService.addOrder(item);
      if (response) {
        await _cartService.clearCart(user?.sId ?? '');
        await getCart();
      }
      notifyListeners();
      return response;
    }
    notifyListeners();

    return false;
  }

  void cartTotalPrice() {
    double _totalPrice = 0;
    double _order = 0;
    if (cart != null) {
      for (CartItem item in cart!) {
        if (item.product?.price == null || item.quantity == null) {
          continue;
        } else {
          _order += (item.product!.price! * item.quantity!);
        }
      }
      _totalPrice =
          _order + _order * (tax / 100) + _order * (discount / 100) + delivery;
    }
    order = _order;
    String total = _totalPrice.toStringAsFixed(3);
    totalPrice = double.parse(total);
    notifyListeners();
  }

  Future<void> getAppointmentByUserId() async {
    final response = await _authService.getAppointmentByUserId(
        userId: user?.sId ?? '', isUpComing: isUpcoming);
    userAppointment = response ?? [];
    notifyListeners();
  }

  Future<bool> cancelAppointment(String appointmentId) async {
    return _authService.cancelAppointment(appointmentId);
  }
}
