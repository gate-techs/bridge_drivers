part of 'poduct_details_cubit.dart';

@immutable
abstract class ProductDetailsState {
  const ProductDetailsState();
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState{
  final ProductDetailsDataRow productDetails;

  const ProductDetailsLoaded(this.productDetails);
}


class ProductDetailsFailed extends ProductDetailsState {
  final String message;

  const ProductDetailsFailed(this.message);
}