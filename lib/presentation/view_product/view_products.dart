import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/cubits/add_product/add_product_cubit.dart';
import 'package:inventory/presentation/add_product_item/add_product_item.dart';
import 'package:inventory/utils/constants.dart';
import 'package:inventory/widgets/search_box.dart';
import '../../model/product_modal.dart';

class ViewProducts extends StatefulWidget {
  const ViewProducts({super.key});

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddProductCubit>(context).getProduct();
  }

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              SearchBox(onChanged: (value) {
                BlocProvider.of<AddProductCubit>(context).searchProducts(value);
              }),
              const SizedBox(
                height: defaultPadding,
              ),
              BlocBuilder<AddProductCubit, AddProductState>(
                builder: (context, state) {
                  if (state is AddProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FetchProductSuccess ||
                      state is SearchProductSuccess) {
                    final List<ProductModal> productList = state
                            is FetchProductSuccess
                        ? (state).productList
                        : (state as SearchProductSuccess).filteredProductList;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                              color: Colors.white,
                              elevation: 3,
                              child: ListTile(
                                isThreeLine: true,
                                title: Text(
                                  productList[index].product,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Price: ${productList[index].price}'),
                                    Text(
                                        'Item Count: ${productList[index].itemCount}'),
                                  ],
                                ),
                                trailing: PopupMenuButton<String>(
                                  padding: const EdgeInsets.only(top: 20),
                                  onSelected: (String choice) {
                                    if (choice == 'Add') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddItem(
                                            product: productList[index].product,
                                            documentId:
                                                productList[index].documentId,
                                          ),
                                        ),
                                      );
                                    } else {}
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: 'Add',
                                        child: Text('Add Item'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'Delete',
                                        child: Text('Delete'),
                                      ),
                                    ];
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding)
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('Something Went Wrong'));
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
