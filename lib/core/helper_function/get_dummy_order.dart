import 'package:fruits_dashboard/features/orders/domain/entities/order_entity/order_entity.dart';
import 'package:fruits_dashboard/features/orders/domain/entities/order_entity/order_product_entity.dart';
import 'package:fruits_dashboard/features/orders/domain/entities/order_entity/shipping_address_entity.dart';

/// Method to return a single dummy OrderModel object
OrderEntity getDummyOrder() {
  return OrderEntity(
    uId: "12345",
    priceOffAllProducts: 20.00,
    orderProductEntity: [
      OrderProductEntity(
        code: "APL001",
        name: "Apple",
        imageUrl: "https://via.placeholder.com/50",
        price: 3.50,
        quantity: 2,
      ),
      OrderProductEntity(
        code: "BNN002",
        name: "Banana",
        imageUrl: "https://via.placeholder.com/50",
        price: 1.20,
        quantity: 5,
      ),
    ],
    shippingAddressEntity: ShippingAddressEntity(
      name: "John Doe",
      email: "john.doe@example.com",
      address: "123 Main Street",
      city: "Springfield",
      floorNumber: "2",
      phoneNumber: "+1234567890",
    ),
  );
}
