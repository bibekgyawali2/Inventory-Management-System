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
  Future<bool> addOrder({
    required String productName,
    required String price,
  }) async {
    try {
      final DocumentReference orderDocRef =
          FirebaseFirestore.instance.collection('Product').doc();

      await orderDocRef.set({
        'Product': productName,
        'Price': price,
        'user_id': currentUser!.uid,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

//add product item
  Future<bool> addItem({
    required String uid,
    required String
        documentId, // Added parameter to accept the product documentId
    required String product,
  }) async {
    try {
      // Reference to the product document in the 'Product' collection
      final DocumentReference productDocRef =
          FirebaseFirestore.instance.collection('Product').doc(documentId);

      // Reference to the 'productList' subcollection inside the product document
      final CollectionReference productListRef =
          productDocRef.collection('productList');

      // Add a new item document to the 'productList' subcollection
      await productListRef.add({
        'uid': uid,
        'documentId': documentId,
      });
      return true;
    } catch (e) {
      // Handle errors as needed
      print('Error adding item: $e');
      return false;
    }
  }

  //checkout items

//fetch Product
  Future<void> getProduct() async {
    emit(AddProductLoading());
    try {
      QuerySnapshot snapshot = await firestore
          .collection('Product')
          .where('user_id', isEqualTo: currentUser!.uid)
          .get();
      List<DocumentSnapshot> documents = snapshot.docs;

      originalProductList =
          await Future.wait(documents.map((DocumentSnapshot document) async {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        // Reference to the 'productList' subcollection inside the product document
        final CollectionReference productListRef = FirebaseFirestore.instance
            .collection('Product')
            .doc(document.id)
            .collection('productList');

        // Fetch the item count from 'productList' subcollection
        QuerySnapshot productListSnapshot = await productListRef.get();
        int itemCount = productListSnapshot.size;

        return ProductModal(
          product: data['Product'],
          price: data['Price'],
          user_id: data['user_id'],
          documentId: document.id,
          itemCount: itemCount,
        );
      }));

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

        // Iterate through the documents and delete each one
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          await productListRef.doc(doc.id).delete();
        }
      }

      // Emit a state indicating successful checkout
    } catch (e) {
      // Handle errors as needed
      print('Error during checkout: $e');
    }
  }
}
