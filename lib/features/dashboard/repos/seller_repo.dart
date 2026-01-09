import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/models/api_service_input_model.dart';
import 'package:fruits_app/core/services/api_service.dart';
import 'package:fruits_app/features/dashboard/models/product_model.dart';
import 'package:fruits_app/features/dashboard/models/seller_model.dart';

class SellerRepo {
  const SellerRepo(this.api);

  final ApiService api;
  Future<Either<Failure, List<SellerModel>>> getSellers() {
    try {
       api.get(apiServiceInputModel: ApiServiceInputModel(url: url));
      return Right([]);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<ProductModel>>> getSellerProducts({required int sellerId}) {}
}