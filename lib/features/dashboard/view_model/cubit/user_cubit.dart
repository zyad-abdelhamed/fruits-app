import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/dashboard/repos/user_repo.dart';

import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  /// Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  /// Old values (for change detection)
  String? _oldName;
  String? _oldEmail;
  String? _oldMobile;

  UserCubit(this._userRepository) : super(UserInitial());

  /// CLEANUP
  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    return super.close();
  }

  /// GET PROFILE
  Future<void> getProfile() async {
    emit(UserLoading());

    final result = await _userRepository.getProfile();

    result.fold((failure) => emit(UserError(failure.message)), (profile) {
      _oldName = profile.name;
      _oldEmail = profile.email;
      _oldMobile = profile.mobile;

      nameController.text = profile.name;
      emailController.text = profile.email;
      mobileController.text = profile.mobile;

      emit(
        UserProfileLoaded(
          profile: profile,
          hasChanges: false,
          isUpdating: false,
        ),
      );
    });
  }

  /// CHECK IF FORM HAS CHANGES (تتنادي من UI)
  bool get hasChanges {
    return nameController.text != _oldName ||
        emailController.text != _oldEmail ||
        mobileController.text != _oldMobile;
  }

  /// UPDATE PROFILE
  Future<void> updateProfile({File? profilePhoto}) async {
    if (state is! UserProfileLoaded) return;

    emit((state as UserProfileLoaded).copyWith(isUpdating: true));

    final result = await _userRepository.updateProfile(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      mobile: mobileController.text.trim(),
    );

    result.fold((failure) => emit(UserError(failure.message)), (profile) {
      _oldName = profile.name;
      _oldEmail = profile.email;
      _oldMobile = profile.mobile;

      nameController.text = profile.name;
      emailController.text = profile.email;
      mobileController.text = profile.mobile;

      emit(
        UserProfileLoaded(
          profile: profile,
          hasChanges: false,
          isUpdating: false,
        ),
      );
    });
  }

  /// CONTACT US
  Future<void> contactUs({
    required String name,
    required String mobile,
    required String message,
  }) async {
    emit(UserLoading());

    final result = await _userRepository.contactUs(
      name: name,
      mobile: mobile,
      message: message,
    );

    result.fold(
      (failure) => emit(UserError(failure.message)),
      (_) => emit(UserActionSuccess()),
    );
  }
}
