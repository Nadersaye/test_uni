import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final Function(String)? onChanged;
  const CustomSearchTextField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
    );
  }
}
