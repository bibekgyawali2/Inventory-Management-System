import 'package:flutter/material.dart';
import 'package:inventory/utils/constants.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText,
            contentPadding: const EdgeInsets.all(defaultPadding),
            hintStyle: Theme.of(context).textTheme.bodySmall,
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
