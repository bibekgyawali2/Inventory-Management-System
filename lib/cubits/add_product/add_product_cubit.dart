import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../model/product_modal.dart';
import '../../utils/constants.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  List<ProductModal> originalProductList = [];
  //place Product
  Future<void> addOrder({
    required String productName,
    required String price,
  }) async {
    final DocumentReference orderDocRef =
        FirebaseFirestore.instance.collection('Product').doc();

    await orderDocRef.set({
      'Product': productName,
      'Price': price,
      'user_id': currentUser!.uid,
    });
  }

  //fetch Product
  Future<void> getProduct() async {
    emit(AddProductLoading());
    try {
      QuerySnapshot snapshot = await firestore
          .collection('Product')
          .where('user_id', isEqualTo: currentUser!.uid)
          .get();
      List<DocumentSnapshot> documents = snapshot.docs;
      originalProductList = documents.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return ProductModal(
          product: data['Product'],
          price: data['Price'],
          user_id: data['user_id'],
        );
      }).toList();
      emit(FetchProductSuccess(originalProductList));
    } catch (e) {
      emit(AddProductError());
    }
  }

  void searchProducts(String query) {
    if (originalProductList.isEmpty) {
      // If the original list is empty, fetch the products first
      getProduct();
      return;
    }

    final List<ProductModal> filteredList = originalProductList
        .where((product) =>
            product.product.toLowerCase().contains(query.toLowerCase()) ||
            product.price.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(SearchProductSuccess(filteredList));
  }
}
