import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/features/dashboard/models/favourite_model.dart';
import 'package:fruits_app/features/dashboard/repos/favourite_repo.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/favorite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepository favouriteRepository;

  FavouriteCubit({required this.favouriteRepository})
    : super(FavouriteInitial());

  /// FETCH USER FAVOURITES
  Future<void> getFavourites() async {
    emit(FavouriteLoading());

    final Either<Failure, List<FavouriteModel>> result =
        await favouriteRepository.getFavourites();

    result.fold(
      (failure) => emit(FavouriteError(failure.message)),
      (favourites) => emit(FavouritesLoaded(favourites)),
    );
  }

  /// TOGGLE FAVOURITE
  Future<void> toggleFavourite(int favId) async {
    emit(FavouriteActionInProgress());

    final Either<Failure, Unit> result = await favouriteRepository
        .toggleFavourite(favId);

    result.fold(
      (failure) => emit(FavouriteError(failure.message)),
      (_) => emit(FavouriteActionSuccess()),
    );

    // REFRESH LIST AFTER SUCCESS
    await getFavourites();
  }
}
