import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/services/dependencey_injection_service.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/widgets/app_banner.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/auth/widgets/phone_number_drop_down_button.dart';
import 'package:fruits_app/features/auth/widgets/required_mark_widget.dart';
import 'package:fruits_app/features/dashboard/view_model/user_cubit.dart';
import 'package:fruits_app/features/dashboard/view_model/user_state.dart';
import 'package:fruits_app/features/dashboard/widgets/profile_avatar.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UserCubit>()..getProfile(),
      child: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserProfileLoaded && !state.isUpdating) {
            AppBanner.showSuccess(
              context,
              message: 'Profile updated successfully',
            );
          }

          if (state is UserError) {
            AppBanner.showError(context, message: state.message);
          }
        },
        child: Scaffold(
          appBar: AppBar(leading: const AppBackButton()),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                final cubit = context.read<UserCubit>();

                if (state is UserInitial || state is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is UserProfileLoaded) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ProfileAvatar(
                          circularBorderColor: AppColors.primaryColor,
                          name: state.profile.name,
                          avatarTopPositionedWidget: Icon(
                            Icons.person_outline,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 25),

                        /// NAME
                        const RequiredMarkWidget(text: AppStrings.fullName),
                        TextFormField(
                          controller: cubit.nameController,
                          validator: (v) =>
                              v == null || v.isEmpty ? 'Required' : null,
                        ),

                        const SizedBox(height: 18),

                        /// EMAIL
                        const RequiredMarkWidget(text: 'Email'),
                        TextFormField(
                          controller: cubit.emailController,
                          validator: (v) =>
                              v == null || v.isEmpty ? 'Required' : null,
                        ),

                        const SizedBox(height: 18),

                        /// MOBILE
                        const RequiredMarkWidget(
                          text: AppStrings.phoneNumberWithWhatsapp,
                        ),
                        TextFormField(
                          controller: cubit.mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            prefixIcon: PhoneNumberFieldDropDownButton(),
                          ),
                          validator: (v) =>
                              v == null || v.isEmpty ? 'Required' : null,
                        ),

                        const SizedBox(height: 32),

                        /// UPDATE BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (!state.hasChanges || state.isUpdating)
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      cubit.updateProfile();
                                    }
                                  },
                            child: state.isUpdating
                                ? const SizedBox(
                                    width: 22,
                                    height: 22,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(AppStrings.update),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
