class SellerModel {
  const SellerModel({
    required this.name,
    required this.deliveryCharges,
    required this.productName,
    required this.isOpen,
  });

  final String name, deliveryCharges, productName;
  final bool isOpen;
}
