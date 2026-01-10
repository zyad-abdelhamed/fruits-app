class UserModel {
  final int id;
  final String name;
  final String? email;
  final String mobile;
  final String? profilePhotoUrl;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.mobile,
    required this.token,
    this.email,
    this.profilePhotoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      token: json['token'],
      profilePhotoUrl: json['profile_photo_url'],
    );
  }
}
