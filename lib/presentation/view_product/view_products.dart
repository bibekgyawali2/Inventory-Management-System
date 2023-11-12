import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/cubits/add_product/add_product_cubit.dart';
import 'package:inventory/utils/constants.dart';

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
              BlocBuilder<AddProductCubit, AddProductState>(
                builder: (context, state) {
                  if (state is AddProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FetchProductSuccess) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.productList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            isThreeLine: true,
                            title: Text(state.productList[index].product),
                            subtitle: Text(state.productList[index].price),
                          ),
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
