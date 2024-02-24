import 'package:flutter/material.dart';

class TextFieldd extends StatelessWidget {
  TextFieldd(
      {super.key, required this.text, this.onChanged, this.obscure = false});
  final String text;
  bool obscure;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        obscureText: obscure,
        validator: (data) {
          if (data!.isEmpty) {
            return 'Field is Required';
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
