import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bisnisku/app/global/theme/my_text.dart';

class NumberField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputFormatter formatter;
  const NumberField({
    super.key,
    required this.label,
    required this.hintText,
    required this.formatter,
  });

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
          inputFormatters: [formatter],
          style: normalTextStyle,
          keyboardType: TextInputType.number,
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
