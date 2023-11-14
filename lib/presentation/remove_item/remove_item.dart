import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/cubits/checkout_item/checkout_item_cubit.dart';
import 'package:inventory/utils/constants.dart';
import 'package:inventory/widgets/custom_button.dart';
import '../../widgets/label_text.dart';

class RemoveItems extends StatefulWidget {
  const RemoveItems({super.key});

  @override
  State<RemoveItems> createState() => _RemoveItemsState();
}

class _RemoveItemsState extends State<RemoveItems> {
  TextEditingController itemName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Items'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: LabelText(
                      controller: itemName,
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
                        onPressed: () async {
                          // Implement QR code scanning logic if needed
                          ScanResult barcodeScanResult =
                              await BarcodeScanner.scan();
                          setState(() {
                            itemName.text = barcodeScanResult.rawContent;
                          });
                        },
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
              BlocConsumer<CheckoutItemCubit, CheckoutItemState>(
                listener: (context, state) {
                  if (state is CheckoutItemSuccess) {
                    // Show a success snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item checked out successfully!'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (state is CheckoutItemNotFound) {
                    // Show a snackbar indicating that no item was found
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No item found for the given ID.'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  } else if (state is CheckoutItemError) {
                    // Show an error snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Failed to check out item. Please try again.'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  // You can add UI elements here based on the state if needed
                  return CustomButton(
                    title: 'Checkout',
                    onPressed: () {
                      BlocProvider.of<CheckoutItemCubit>(context)
                          .checkoutItem(uid: itemName.text);
                      itemName.clear();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
