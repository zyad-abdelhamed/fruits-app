class VendorProductModel {
  final int id;
  final String name;
  final String nameEn;
  final double price;
  final double priceAfterDiscount;
  final String img;
  final String unit;
  final String unitEn;
  final int isFavorite;
  final String nameCategory;
  final String details;

  VendorProductModel({
    required this.details,
    required this.nameCategory,
    required this.id,
    required this.name,
    required this.nameEn,
    required this.price,
    required this.priceAfterDiscount,
    required this.img,
    required this.unit,
    required this.unitEn,
    required this.isFavorite,
  });

  factory VendorProductModel.fromJson(Map<String, dynamic> json) {
    return VendorProductModel(
      id: json['id'],
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      price: (json['price'] as num).toDouble(),
      priceAfterDiscount: (json['price_after_discount'] as num).toDouble(),
      img: json['img'] ?? '',
      unit: json['unit'] ?? '',
      unitEn: json['unit_en'] ?? '',
      isFavorite: json['is_favorite'] ?? 0,
      nameCategory: json['name_category_en'] ?? '',
      details: json['details_en'] ?? '',
    );
  }
}
