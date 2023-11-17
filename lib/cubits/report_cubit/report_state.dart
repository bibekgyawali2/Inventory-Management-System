part of 'report_cubit.dart';

@immutable
abstract class ReportState {}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportError extends ReportState {}

class FetchReportSuccess extends ReportState {
  final List<ReportModal> reportList;

  FetchReportSuccess(this.reportList);

  @override
  List<Object?> get props => [reportList];
}
