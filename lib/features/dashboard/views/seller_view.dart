import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/services/dependencey_injection_service.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/dashboard/models/vendor_model.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/vendors_cubit.dart';
import 'package:fruits_app/features/dashboard/widgets/categories_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/seller_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/vendor_products_model.dart';

class SellerView extends StatelessWidget {
  const SellerView({super.key, required this.seller});

  final VendorModel seller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<VendorCubit>()..getVendorProducts(seller.id),
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButton(),
          title: const Text(AppStrings.fruitsMarket),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.0,
            children: [
              Center(child: SellerWidget(sellerModel: seller)),

              Text('Categories', style: context.titleMedium),
              SizedBox(height: 100.0, child: CategoriesWidget(radius: 16.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Products', style: context.titleMedium),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
                ],
              ),

              const VendorProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
