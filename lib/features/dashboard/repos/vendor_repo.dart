import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/constants/api_constants.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/services/api_service.dart';
import 'package:fruits_app/core/utils/base_repo.dart';
import '../models/vendor_model.dart';
import '../models/vendor_product_model.dart';

class VendorRepository extends BaseRepository {
  final ApiService apiService;

  VendorRepository(this.apiService);

  // GET VENDORS
  Future<Either<Failure, List<VendorModel>>> getVendors() async {
    return execute(() async {
      final response = await apiService.get(ApiConstants.vendors);
      final data = response.data;

      final List list = data['data']['data'];
      final vendors = list.map((e) => VendorModel.fromJson(e)).toList();
      return vendors;
    });
  }

  // GET VENDOR PRODUCTS
  Future<Either<Failure, List<VendorProductModel>>> getVendorProducts(
    int vendorId,
  ) async {
    return execute(() async {
      final response = await apiService.get(
        ApiConstants.getVendorsProducts,
        queryParameters: {'vendor_id': vendorId},
      );

      final data = response.data;

      final List list = data['data'];
      final products = list.map((e) => VendorProductModel.fromJson(e)).toList();
      return products;
    });
  }
}
