class ApiConstants {
  static const String baseUrl = 'https://fruits.sys-web.net/api';

  // Auth
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String forgetPassword = '$baseUrl/forget_pass_user';

  // Favourites
  static const String userFavourite = '$baseUrl/user_favorite';
  static const String userFavouriteAr = '$baseUrl/user_favorite/t/ar';

  // Profile
  static const String profile = '$baseUrl/profile';
  static const String updateProfile = '$baseUrl/update_profile/1';

  // Contact Us
  static const String contactUs = '$baseUrl/contact_us';

  // Vendors
  static const String vendors = '$baseUrl/getvendors';
  static const String getVendorsProducts = '$baseUrl/get_vendor_products';
}
