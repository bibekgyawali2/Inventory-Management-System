import 'package:flutter/material.dart';
import 'package:inventory/utils/constants.dart';
import 'package:inventory/widgets/custom_button.dart';

import '../../widgets/label_text.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController uid = TextEditingController();
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
              CustomButton(title: "Add", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
