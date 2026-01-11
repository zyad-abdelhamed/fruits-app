import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/dashboard/models/vendor_model.dart';
import 'package:fruits_app/features/dashboard/models/vendor_product_model.dart';

abstract class VendorState extends Equatable {
  const VendorState();

  @override
  List<Object?> get props => [];
}

/// Initial
class VendorInitial extends VendorState {}

/// Loading
class VendorLoading extends VendorState {}

/// Vendors Loaded
class VendorsLoaded extends VendorState {
  final List<VendorModel> vendors;

  const VendorsLoaded(this.vendors);

  @override
  List<Object?> get props => [vendors];
}

/// Vendor Products Loaded
class VendorProductsLoaded extends VendorState {
  final int vendorId;
  final List<VendorProductModel> products;

  const VendorProductsLoaded({required this.vendorId, required this.products});

  @override
  List<Object?> get props => [vendorId, products];
}

/// Error
class VendorError extends VendorState {
  final String message;

  const VendorError(this.message);

  @override
  List<Object?> get props => [message];
}
