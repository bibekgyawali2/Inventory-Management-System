import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../../utils/constants.dart';
part 'checkout_item_state.dart';

class CheckoutItemCubit extends Cubit<CheckoutItemState> {
  CheckoutItemCubit() : super(CheckoutItemInitial());

// Checkout item
  Future<void> checkoutItem({
    required String uid,
  }) async {
    try {
      // Query the 'Product' collection to find documents with the specified UID
      QuerySnapshot productQuerySnapshot = await FirebaseFirestore.instance
          .collection('Product')
          .where('user_id', isEqualTo: currentUser!.uid)
          .get();

      // Iterate through the products to find the one containing the 'productList' subcollection
      for (QueryDocumentSnapshot productDoc in productQuerySnapshot.docs) {
        // Reference to the 'productList' subcollection inside the product document
        final CollectionReference productListRef =
            productDoc.reference.collection('productList');
        // Query the 'productList' subcollection to find documents with the specified UID
        QuerySnapshot querySnapshot =
            await productListRef.where('uid', isEqualTo: uid).get();

        // Check if any items were found
        if (querySnapshot.docs.isNotEmpty) {
          // Iterate through the documents and delete each one
          for (QueryDocumentSnapshot doc in querySnapshot.docs) {
            await productListRef.doc(doc.id).delete();
          }
          // Emit a state indicating successful checkout
          emit(CheckoutItemSuccess());
          return; // Exit the method if items were found and deleted
        }
      }

      // If no items were found, emit a state indicating that
      emit(CheckoutItemNotFound());
    } catch (e) {
      // Handle errors as needed
      emit(CheckoutItemError());
      print('Error during checkout: $e');
    }
  }
}
