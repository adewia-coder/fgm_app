import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: S.of(context).flight_number,
        ),
      ),
    );
  }
}
