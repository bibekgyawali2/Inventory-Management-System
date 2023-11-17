import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModal {
  final String price;
  final String product;
  final String uid;
  final Timestamp timestamp;

  ReportModal({
    required this.price,
    required this.product,
    required this.uid,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'product': product,
      'uid': uid,
      'price': price,
      'timestamp': timestamp,
    };
  }
}
