import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/core/theme/color_theme.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key, required this.editingController, required this.hintText, this.onValidator});

  final TextEditingController editingController;
  final String? Function(String? s)? onValidator;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: editingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.black),
          errorStyle: const TextStyle(color: Colors.red),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
      validator: (value) => onValidator?.call(value),
      style: const TextStyle(color: Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
