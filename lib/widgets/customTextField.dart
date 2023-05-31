import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsecure;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isObsecure});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObsecure,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
