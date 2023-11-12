part of 'add_product_cubit.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductError extends AddProductState {}

class FetchProductSuccess extends AddProductState {
  final List<ProductModal> productList;

  FetchProductSuccess(this.productList);

  @override
  List<Object?> get props => [productList];
}
