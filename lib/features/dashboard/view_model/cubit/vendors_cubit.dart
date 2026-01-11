import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/dashboard/repos/vendor_repo.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/vendors_state.dart';

class VendorCubit extends Cubit<VendorState> {
  final VendorRepository vendorRepository;

  VendorCubit(this.vendorRepository) : super(VendorInitial());

  /// GET VENDORS
  Future<void> getVendors() async {
    emit(VendorLoading());

    final result = await vendorRepository.getVendors();

    result.fold(
      (failure) => emit(VendorError(failure.message)),
      (vendors) => emit(VendorsLoaded(vendors)),
    );
  }

  /// GET VENDOR PRODUCTS
  Future<void> getVendorProducts(int vendorId) async {
    emit(VendorLoading());

    final result = await vendorRepository.getVendorProducts(vendorId);

    result.fold(
      (failure) => emit(VendorError(failure.message)),
      (products) =>
          emit(VendorProductsLoaded(vendorId: vendorId, products: products)),
    );
  }
}
