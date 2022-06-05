import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  bool hideText;
  Function validator;
  Widget prefixIcon, suffixIcon;
  String hintText;

  AuthTextFormField({
    required this.controller,
    required this.hideText,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      obscureText: hideText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        //////////////////////////////////////////////////
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        /////////////////////////////////////////////////////
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        //////////////////////////////////////////////////
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        //////////////////////////////////////////////////
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
