class FavouriteModel {
  final int id;
  final int favoId;
  final double priceWithDiscount;
  final FavouriteProductModel product;

  FavouriteModel({
    required this.id,
    required this.favoId,
    required this.priceWithDiscount,
    required this.product,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'],
      favoId: json['favo_id'],
      priceWithDiscount: (json['price_with_discount'] as num).toDouble(),
      product: FavouriteProductModel.fromJson(json['product']),
    );
  }
}

class FavouriteProductModel {
  final int id;
  final String name;
  final String nameEn;
  final double price;
  final String img;
  final String unit;
  final String unitEn;
  final int discount;
  final String details;
  final String detailsEn;

  FavouriteProductModel({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.price,
    required this.img,
    required this.unit,
    required this.unitEn,
    required this.discount,
    required this.details,
    required this.detailsEn,
  });

  factory FavouriteProductModel.fromJson(Map<String, dynamic> json) {
    return FavouriteProductModel(
      id: json['id'],
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      price: (json['price'] as num).toDouble(),
      img: json['img'] ?? '',
      unit: json['unit'] ?? '',
      unitEn: json['unit_en'] ?? '',
      discount: json['discount'] ?? 0,
      details: json['details'] ?? '',
      detailsEn: json['details_en'] ?? '',
    );
  }
}
