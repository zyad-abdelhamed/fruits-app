import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/dashboard/models/profile_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

/// INITIAL
class UserInitial extends UserState {}

/// GLOBAL LOADING (used for first load & actions like contact us)
class UserLoading extends UserState {}

/// PROFILE READY / LOADED
class UserProfileLoaded extends UserState {
  final ProfileModel profile;
  final bool hasChanges;
  final bool isUpdating;

  const UserProfileLoaded({
    required this.profile,
    required this.hasChanges,
    required this.isUpdating,
  });

  UserProfileLoaded copyWith({
    ProfileModel? profile,
    bool? hasChanges,
    bool? isUpdating,
  }) {
    return UserProfileLoaded(
      profile: profile ?? this.profile,
      hasChanges: hasChanges ?? this.hasChanges,
      isUpdating: isUpdating ?? this.isUpdating,
    );
  }

  @override
  List<Object?> get props => [profile, hasChanges, isUpdating];
}

/// SUCCESS (for actions like contact us)
class UserActionSuccess extends UserState {}

/// ERROR
class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}
