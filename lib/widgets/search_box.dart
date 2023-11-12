import 'package:flutter/material.dart';
import 'package:inventory/utils/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key,
    key,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 4, // 5 top and bottom
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: 'Search',
        ),
      ),
    );
  }
}
