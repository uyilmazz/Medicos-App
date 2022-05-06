import 'dart:io';

import 'package:dio/dio.dart';
import 'package:medicos_app/view/user/model/user_cart.dart';
import 'package:medicos_app/view/user/service/ICart_service.dart';

import '../../pharmacy/model/order.dart';

class CartService extends ICartService {
  static CartService? _instance;
  static CartService get instance => _instance ??= CartService._init();

  late final Dio dio;
  CartService._init() {
    final _options = BaseOptions(baseUrl: 'http://10.0.2.2:3000');
    dio = Dio(_options);
  }

  @override
  Future<List<CartItem>?> getCart(String userId) async {
    try {
      final response = await dio.get('/users/cart/$userId');
      if (response.statusCode == HttpStatus.ok) {
        final dataList = List.castFrom(response.data);
        return dataList.map((data) => CartItem.fromJson(data)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<bool> addProductInCart(String productId, String userId) async {
    try {
      final response = await dio.post('/users/cart/addProduct',
          data: {"userId": userId, "productId": productId});
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  @override
  Future<bool> decrementProductFromCart(String productId, String userId) async {
    try {
      final response = await dio.post('/users/cart/decrementProduct',
          data: {"userId": userId, "productId": productId});
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  @override
  Future<bool> clearCart(String userId) async {
    try {
      final response =
          await dio.post('/users/cart/clearCart', data: {"userId": userId});
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  @override
  Future<bool> addOrder(Order item) async {
    try {
      final response = await dio.post('/orders', data: item.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
