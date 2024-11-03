import 'package:flutter/material.dart';
import 'package:myapp/app/global/theme/my_text.dart';

class CustomField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  const CustomField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: subtitleTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          style: normalTextStyle,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
