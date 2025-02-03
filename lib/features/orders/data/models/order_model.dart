import 'package:fruits_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruits_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_dashboard/features/orders/domain/entities/order_entity/order_entity.dart';

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

  toEntity() {
    return OrderEntity(
      priceOffAllProducts: priceOffAllProducts,
      uId: uId,
      orderProductEntity: orderProductModel.map((e) => e.toEntity()).toList(),
      shippingAddressEntity: shippingAddressModel.toEntity(),
    );
  }
}
