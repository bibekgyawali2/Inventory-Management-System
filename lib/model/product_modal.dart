class ProductModal {
  final String price;
  final String product;
  final String user_id;
  final String documentId;
  final int itemCount;

  ProductModal({
    required this.price,
    required this.product,
    required this.user_id,
    required this.documentId,
    required this.itemCount,
    // required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'Product': product,
      'user_id': user_id,
      'Price': price,

      //'status': status,
    };
  }
}
