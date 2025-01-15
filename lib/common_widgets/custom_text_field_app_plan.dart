import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;

  // Constructor to accept controller and other properties
  const CustomTextField({super.key, 
    required this.controller,
    required this.hintText,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Set border color to grey
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
      ),
    );
  }
}
