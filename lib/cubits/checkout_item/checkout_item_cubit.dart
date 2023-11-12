import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'checkout_item_state.dart';

class CheckoutItemCubit extends Cubit<CheckoutItemState> {
  CheckoutItemCubit() : super(CheckoutItemInitial());
}
