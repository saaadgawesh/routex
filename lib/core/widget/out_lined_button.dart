

import 'package:flutter/material.dart';

class CustomOutlinedbutton extends StatelessWidget {
  const CustomOutlinedbutton({
    super.key, required this.text,
    required this.onpressed,

  });
final String text;
final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed:onpressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: Colors.grey[300]!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child:  Text(
       text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}
