class ProfileModel {
  final int id;
  final String name;
  final String email;
  final String mobile;
  final String profilePhotoPath;
  final String? profilePhotoUrl;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.profilePhotoPath,
    this.profilePhotoUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      profilePhotoPath: json['profile_photo_path'],
      profilePhotoUrl: json['profile_photo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'mobile': mobile,
      'profile_photo_path': profilePhotoPath,
    };
  }
}
