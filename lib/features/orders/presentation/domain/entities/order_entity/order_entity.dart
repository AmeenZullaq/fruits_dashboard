import 'package:fruits_dashboard/features/add_product/domain/entitis/product_entity.dart';
import 'package:fruits_dashboard/features/orders/presentation/domain/entities/order_entity/shipping_address_entity.dart';

class OrderEntity {
  final List<ProductEntity> products;
  final ShippingAddressEntity shippingAddressEntity;
  final num priceOffAllProducts;
  final String uId;
  final bool payWithcash;

  OrderEntity({
    required this.payWithcash,
    required this.uId,
    required this.products,
    required this.shippingAddressEntity,
    required this.priceOffAllProducts,
  });
}
