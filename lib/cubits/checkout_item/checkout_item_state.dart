part of 'checkout_item_cubit.dart';

@immutable
abstract class CheckoutItemState {}

class CheckoutItemInitial extends CheckoutItemState {}

class CheckoutItemError extends CheckoutItemState {}

class CheckoutItemSuccess extends CheckoutItemState {}

class CheckoutItemNotFound extends CheckoutItemState {}
