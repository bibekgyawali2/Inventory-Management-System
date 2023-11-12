import 'package:flutter/material.dart';
import 'package:inventory/utils/constants.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Items')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
        ),
      ),
    );
  }
}
