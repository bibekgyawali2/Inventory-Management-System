// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/cubits/add_product/add_product_cubit.dart';
import 'package:inventory/utils/constants.dart';
import 'package:inventory/widgets/custom_button.dart';

import '../../widgets/label_text.dart';

class AddItem extends StatefulWidget {
  final String? product;
  final String documentId;
  const AddItem({super.key, this.product, required this.documentId});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController uid = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Items')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const SizedBox(height: defaultPadding),
              Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: LabelText(
                      controller: uid,
                      label: 'Unique Identification Number',
                      hintText: 'eg: 12434829348',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: defaultPadding),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.qr_code,
                          size: 50,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: defaultPadding),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      title: "Add",
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        bool result =
                            await BlocProvider.of<AddProductCubit>(context)
                                .addItem(
                                    uid: uid.text,
                                    documentId: widget.documentId,
                                    product: widget.product!);
                        if (result) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Item added successfully!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          uid.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Failed to add Item. Please try again.'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
