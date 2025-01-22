import 'package:fruits_dashboard/features/orders/presentation/data/models/order_product_model.dart';
import 'package:fruits_dashboard/features/orders/presentation/data/models/shipping_address_model.dart';

class OrderModel {
  final String uId;
  final List<OrderProductModel> orderProductModel;
  final ShippingAddressModel shippingAddressModel;
  final num priceOffAllProducts;

  OrderModel({
    required this.priceOffAllProducts,
    required this.uId,
    required this.orderProductModel,
    required this.shippingAddressModel,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      priceOffAllProducts: json['priceOffAllProducts'],
      uId: json['uId'],
      orderProductModel: json['orderProductModel'],
      shippingAddressModel: json['shippingAddressModel'],
    );
  }

  toJson() {
    return {
      'priceOffAllProducts': priceOffAllProducts,
      'uId': uId,
      'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
      'shippingAddressModel': shippingAddressModel.toJson(),
    };
  }
}
