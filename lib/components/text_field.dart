import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: TextField(
        decoration: InputDecoration(
          //prefixIcon: Icon(Icons.search),
          //suffixIcon: Icon(Icons.clear),
          //labelText: 'Filled',
          hintText: S.of(context).flight_number,
          //helperText: 'supporting text',
          //filled: true,
        ),
      ),
    );
  }
}
