import 'package:flutter/material.dart';
import 'package:inventory/utils/constants.dart';
import '../../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management System'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: defaultPadding,
                mainAxisSpacing: defaultPadding,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1,
                children: [
                  HomeCards(
                    title: 'Add Products',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.addProduct);
                    },
                  ),
                  HomeCards(
                      title: 'Add Products Item',
                      onTap: () {
                        Navigator.pushNamed(context, Routes.addItem);
                      }),
                  HomeCards(
                      title: 'View Products',
                      onTap: () {
                        Navigator.pushNamed(context, Routes.viewProducts);
                      }),
                  HomeCards(
                      title: 'Checkout Items',
                      onTap: () {
                        Navigator.pushNamed(context, Routes.removeItem);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCards extends StatelessWidget {
  const HomeCards({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 500,
          width: 500,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              )),
        ),
      ),
    );
  }
}
