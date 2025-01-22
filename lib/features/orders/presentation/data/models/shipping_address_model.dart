class ShippingAddressModel {
  final String name;
  final String email;
  final String address;
  final String city;
  final String floorNumber;
  final String phoneNumber;

  ShippingAddressModel({
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.floorNumber,
    required this.phoneNumber,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      floorNumber: json['floorNumber'],
      phoneNumber: json['phoneNumber'],
    );
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'floorNumber': floorNumber,
      'phoneNumber': phoneNumber,
    };
  }
}
