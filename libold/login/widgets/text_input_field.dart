import 'package:flutter/material.dart';
import '../../../libold/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final IconData icon;
  const TextInputField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isObscure = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: bordercolor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: bordercolor,
              ))),
      obscureText: isObscure,
    );
  }
}
