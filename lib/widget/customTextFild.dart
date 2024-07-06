import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/custom_surfix_icon.dart';

Widget customTextFormFiled({
  required String title,
  required String hint,
  required String errorMessage,
  required controller,
  required icon,

  textType,
  required TextInputType keyboardType,

}) {
  return TextFormField(
    controller: controller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      }
      return null;
    },
    decoration: InputDecoration(
      suffixIcon: SvgPicture.asset(height: 16,width: 16,'icon',color: Colors.black,),

      label: Text(title),
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.black26,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black26, // Default border color
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
