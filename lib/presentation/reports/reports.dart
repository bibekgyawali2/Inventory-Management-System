import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:open_file/open_file.dart';
import 'package:share/share.dart';
import '../../cubits/report_cubit/report_cubit.dart';
import '../../model/report_modal.dart';
import '../../utils/constants.dart';

class ViewReport extends StatefulWidget {
  const ViewReport({super.key});

  @override
  State<ViewReport> createState() => _ViewReportState();
}

class _ViewReportState extends State<ViewReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Report'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ReportCubit, ReportState>(
                  builder: (context, state) {
                    if (state is ReportLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FetchReportSuccess) {
                      return buildDataTable(state.reportList);
                    } else if (state is ReportError) {
                      return const Center(child: Text('Error fetching report'));
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final reportList = (BlocProvider.of<ReportCubit>(context)
                          .state as FetchReportSuccess)
                      .reportList;
                  final pdfPath = await generatePdf(reportList);
                  if (pdfPath != null) {
                    // Open the PDF with an external viewer
                    OpenFile.open(pdfPath);
                  }
                },
                child: Text('Generate Invoice'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDataTable(List<ReportModal> reportList) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Product')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('UID')),
        DataColumn(label: Text('Timestamp')),
      ],
      rows: reportList
          .map(
            (report) => DataRow(
              cells: [
                DataCell(Text(report.product)),
                DataCell(Text(report.price.toString())),
                DataCell(Text(report.uid)),
                DataCell(Text(report.timestamp.toDate().toString())),
              ],
            ),
          )
          .toList(),
    );
  }

  Future<String?> generatePdf(List<ReportModal> reportList) async {
    final pdfLib.Document pdf = pdfLib.Document();

    pdf.addPage(
      pdfLib.MultiPage(
        build: (context) => [
          pdfLib.Table.fromTextArray(
            context: context,
            data: <List<String>>[
              <String>['Product', 'Price', 'UID', 'Timestamp'],
              for (var report in reportList)
                <String>[
                  report.product,
                  report.price.toString(),
                  report.uid,
                  report.timestamp.toDate().toString(),
                ],
            ],
          ),
        ],
      ),
    );

    final Uint8List bytes = await pdf.save();
    final pdfPath =
        '/path/to/generated_invoice.pdf'; // Replace with an actual path on your device
    await File(pdfPath).writeAsBytes(bytes);
    return pdfPath;
  }
}
