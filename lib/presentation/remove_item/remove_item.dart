import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/cubits/add_product/add_product_cubit.dart';
import 'package:inventory/presentation/add_product_item/add_product_item.dart';
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
              CustomButton(
                title: 'Checkout',
                onPressed: () {
                  BlocProvider.of<AddProductCubit>(context)
                      .checkoutItem(uid: itemName.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
