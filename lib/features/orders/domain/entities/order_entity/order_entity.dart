import 'package:fruits_dashboard/features/orders/domain/entities/order_entity/order_product_entity.dart';
import 'package:fruits_dashboard/features/orders/domain/entities/order_entity/shipping_address_entity.dart';

class OrderEntity {
  final String uId;
  final List<OrderProductEntity> orderProductEntity;
  final ShippingAddressEntity shippingAddressEntity;
  final num priceOffAllProducts;

  OrderEntity({
    required this.priceOffAllProducts,
    required this.uId,
    required this.orderProductEntity,
    required this.shippingAddressEntity,
  });
}
