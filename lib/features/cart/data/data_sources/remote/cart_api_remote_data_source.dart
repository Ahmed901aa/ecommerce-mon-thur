import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartAPIRemoteDataSource implements CartRemoteDataSource {
  final Dio _dio;

  const CartAPIRemoteDataSource(this._dio);

  @override
  Future<void> addToCart(String productId) async {
    try {
      await _dio.post(
        APIConstants.cartEndpoint,
        data: {
          'productId': productId,
        },
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to add product to cart');
    }
  }

  @override
  Future<CartResponse> getCart() {
    throw UnimplementedError();
  }

  @override
  Future<CartResponse> updateCart(String productId, int quantity) {
    throw UnimplementedError();
  }

  @override
  Future<CartResponse> deleteFromCart(String productId) {
    throw UnimplementedError();
  }
}
