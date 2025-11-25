class ProductModel {
  final String name;
  final String image;
  final String description;
  final double price;
    final double oldPrice;
  final double discount;
  final int quantity;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.quantity,
  });
}