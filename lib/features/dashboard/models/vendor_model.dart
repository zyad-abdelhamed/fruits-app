class VendorModel {
  final int id;
  final String name;
  final String nameEn;
  final String img;
  final String isOpened;
  final String rate;

  VendorModel({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.img,
    required this.isOpened,
    required this.rate,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'],
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      img: json['img'] ?? '',
      isOpened: json['is_opened'] ?? 'N',
      rate: json['rate']?.toString() ?? '0',
    );
  }
}
