import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key, required this.text, this.ontab});
  final String text;
  final void Function()? ontab;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: ontab,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: 35,
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
