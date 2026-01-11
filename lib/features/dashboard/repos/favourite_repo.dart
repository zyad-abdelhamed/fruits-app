import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/constants/api_constants.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/services/api_service.dart';
import 'package:fruits_app/core/utils/base_repo.dart';
import '../models/favourite_model.dart';

class FavouriteRepository extends BaseRepository {
  final ApiService apiService;

  FavouriteRepository({required this.apiService});

  // GET USER FAVOURITES
  Future<Either<Failure, List<FavouriteModel>>> getFavourites() async {
    return execute(() async {
      final response = await apiService.get(ApiConstants.userFavouriteAr);
      final data = response.data;

      final List list = data['data'];
      final favourites = list.map((e) => FavouriteModel.fromJson(e)).toList();
      return favourites;
    });
  }

  // ADD / DELETE FAVOURITE
  Future<Either<Failure, Unit>> toggleFavourite(int favId) async {
    return execute(() async {
      await apiService.post(
        ApiConstants.userFavourite,
        data: {'favo_id': favId},
      );
      return unit;
    });
  }
}
