import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory/model/report_modal.dart';
import 'package:meta/meta.dart';
import '../../utils/constants.dart';
part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());
  List<ReportModal> originalReportList = [];

  //fetch report
  Future<void> getReport() async {
    emit(ReportLoading());
    try {
      QuerySnapshot snapshot = await firestore
          .collection('users')
          .doc(currentUser!.uid)
          .collection('CheckIn')
          .get();

      List<DocumentSnapshot> documents = snapshot.docs;
      originalReportList =
          await Future.wait(documents.map((DocumentSnapshot document) async {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return ReportModal(
          product: data['product'] ?? '',
          price: data['price'] ?? '',
          uid: data['uid'] ?? '',
          timestamp: data['timestamp'] ?? '',
        );
      }));
      emit(FetchReportSuccess(originalReportList));
    } catch (e) {
      emit(ReportError());
    }
  }
}
