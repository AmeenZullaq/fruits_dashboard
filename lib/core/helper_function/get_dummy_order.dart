import 'package:fruits_dashboard/features/orders/presentation/data/models/order_model.dart';
import 'package:fruits_dashboard/features/orders/presentation/data/models/order_product_model.dart';
import 'package:fruits_dashboard/features/orders/presentation/data/models/shipping_address_model.dart';

/// Method to return a single dummy OrderModel object
OrderModel getDummyOrder() {
  return OrderModel(
    uId: "12345",
    priceOffAllProducts: 20.00,
    orderProductModel: [
      OrderProductModel(
        code: "APL001",
        name: "Apple",
        imageUrl: "https://via.placeholder.com/50",
        price: 3.50,
        quantity: 2,
      ),
      OrderProductModel(
        code: "BNN002",
        name: "Banana",
        imageUrl: "https://via.placeholder.com/50",
        price: 1.20,
        quantity: 5,
      ),
    ],
    shippingAddressModel: ShippingAddressModel(
      name: "John Doe",
      email: "john.doe@example.com",
      address: "123 Main Street",
      city: "Springfield",
      floorNumber: "2",
      phoneNumber: "+1234567890",
    ),
  );
}
