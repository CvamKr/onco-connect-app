import 'package:flutter/material.dart';

class MyTextFormfield extends StatelessWidget {
  MyTextFormfield(
      {this.text = "",
      required this.validator,
      super.key,
      required this.controller});
  final String text;
  String? Function(String?)? validator;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        label: Text(text),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
