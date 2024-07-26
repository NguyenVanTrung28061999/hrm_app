import 'package:app_hrm/screens/widgets/text_custom.dart';
import 'package:flutter/material.dart';

class InputCustomField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String placeholder;

  InputCustomField({
    required this.label,
    required this.icon,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustom.bold(
          label,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 8),
        TextField(
          style:
              const TextStyle(fontFamily: 'ProximaSoft-Regular', fontSize: 14),
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: placeholder,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
