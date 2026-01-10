import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/widgets/app_banner.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/auth/widgets/required_mark_widget.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/user_cubit.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/user_state.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    context.read<UserCubit>().contactUs(
      name: nameController.text.trim(),
      mobile: mobileController.text.trim(),
      message: messageController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(context.read()),
      child: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserActionSuccess) {
            AppBanner.showSuccess(
              context,
              message: 'Message sent successfully',
            );
          } else if (state is UserError) {
            AppBanner.showError(context, message: state.message);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: const AppBackButton(),
            title: Text(AppStrings.contactUs),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),

                    /// Name
                    const RequiredMarkWidget(text: "Name", isRequired: true),
                    TextFormField(
                      controller: nameController,
                      validator: (value) =>
                          value!.isEmpty ? 'Name is required' : null,
                    ),

                    const SizedBox(height: 20),

                    /// Mobile
                    const RequiredMarkWidget(
                      text: "Mobile Number",
                      isRequired: true,
                    ),
                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value!.isEmpty ? 'Mobile is required' : null,
                    ),

                    const SizedBox(height: 20),

                    /// Message
                    const RequiredMarkWidget(text: "Message", isRequired: true),
                    TextFormField(
                      controller: messageController,
                      maxLines: 6,
                      validator: (value) =>
                          value!.isEmpty ? 'Message is required' : null,
                    ),

                    const SizedBox(height: 30),

                    /// Submit Button (Only rebuilds here)
                    BlocBuilder<UserCubit, UserState>(
                      buildWhen: (prev, curr) =>
                          curr is UserLoading || curr is! UserLoading,
                      builder: (context, state) {
                        final isLoading = state is UserLoading;

                        return ElevatedButton(
                          onPressed: isLoading ? null : () => _submit(context),
                          child: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(AppStrings.submit),
                        );
                      },
                    ),

                    const SizedBox(height: 30),

                    /// Social Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        _SocialIcon(ImagesRoutesConstants.call),
                        SizedBox(width: 20),
                        _SocialIcon(ImagesRoutesConstants.facebook),
                        SizedBox(width: 20),
                        _SocialIcon(ImagesRoutesConstants.instagram),
                        SizedBox(width: 20),
                        _SocialIcon(ImagesRoutesConstants.youtue),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon(this.image);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      child: Image.asset(
        image,
        height: ConstantsValues.iconDefaultSize,
        width: ConstantsValues.iconDefaultSize,
      ),
    );
  }
}
