import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final Widget prefix_icon;
  final TextInputType key_bord;
   final bool obscure_text ;
   final dynamic validation;
   final dynamic controller;
   InputWidget({
    super.key, required this.label, required this.prefix_icon, required this.key_bord, required this.obscure_text,
  this.validation, this.controller
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      keyboardType: key_bord,
        obscureText: obscure_text,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: prefix_icon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none)),
    );
  }
}