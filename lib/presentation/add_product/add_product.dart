import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/utils/constants.dart';
import 'package:inventory/widgets/custom_button.dart';
import '../../cubits/add_product/add_product_cubit.dart';
import '../../widgets/label_text.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController productName = TextEditingController();
  TextEditingController price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              LabelText(
                controller: productName,
                label: 'Enter Product Name',
                hintText: 'eg: Tuborg',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: defaultPadding),
              LabelText(
                controller: price,
                label: 'Enter Product Price',
                hintText: 'eg: 100',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: defaultPadding),
              CustomButton(
                title: 'Submit',
                onPressed: () {
                  BlocProvider.of<AddProductCubit>(context).addOrder(
                      price: price.text, productName: productName.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}




            // const SizedBox(height: defaultPadding),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 9,
              //       child: LabelText(
              //         controller: itemName,
              //         label: 'Unique Identification Number',
              //         hintText: 'eg: 12434829348',
              //         keyboardType: TextInputType.number,
              //       ),
              //     ),
              //     Expanded(
              //       flex: 1,
              //       child: Padding(
              //         padding: const EdgeInsets.only(top: defaultPadding),
              //         child: IconButton(
              //           onPressed: () {},
              //           icon: const Icon(
              //             Icons.qr_code,
              //             size: 50,
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),