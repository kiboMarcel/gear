import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final Icon icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  RoundedInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.icon,
    required this.validator,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          filled: true,
          prefixIcon: icon,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white24),
          border: InputBorder.none),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
