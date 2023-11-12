class ProductModal {
  final String price;
  final String product;
  final String user_id;

  ProductModal({
    required this.price,
    required this.product,
    required this.user_id,
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
