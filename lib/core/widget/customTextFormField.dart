
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController nameController, required this.labeltext, required this.hinttext, required this.validator, required this.prefexicon,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final String labeltext;
  final String hinttext;
  final IconData prefexicon;
  final String ? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        labelText:labeltext,
        hintText: hinttext,
        prefixIcon:  Icon(prefexicon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator:validator
    );
  }
}
