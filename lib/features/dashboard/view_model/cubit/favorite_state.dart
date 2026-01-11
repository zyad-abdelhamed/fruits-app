import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/dashboard/models/favourite_model.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object?> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouritesLoaded extends FavouriteState {
  final List<FavouriteModel> favourites;

  const FavouritesLoaded(this.favourites);

  @override
  List<Object?> get props => [favourites];
}

class FavouriteError extends FavouriteState {
  final String message;

  const FavouriteError(this.message);

  @override
  List<Object?> get props => [message];
}

class FavouriteActionInProgress extends FavouriteState {}

class FavouriteActionSuccess extends FavouriteState {}
