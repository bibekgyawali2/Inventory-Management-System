// ignore_for_file: use_build_context_synchronously,

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/utils/constants.dart';
import 'package:inventory/widgets/custom_button.dart';
import '../../cubits/add_product/add_product_cubit.dart';
import '../../routes/routes.dart';
import '../../widgets/label_text.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController productName = TextEditingController();
  TextEditingController price = TextEditingController();
  bool isLoading = false;
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
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      title: 'Submit',
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        bool result =
                            await BlocProvider.of<AddProductCubit>(context)
                                .addOrder(
                                    price: price.text,
                                    productName: productName.text);
                        setState(() {
                          isLoading = false;
                        });
                        if (result) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Product added successfully!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.pushNamed(context, Routes.viewProducts);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Failed to add product. Please try again.'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
