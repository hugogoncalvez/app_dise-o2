import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration loginInputDecoration({
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color(0xff425CCE),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Color(0xff425CCE),
        ),
      ),
      labelStyle: TextStyle(color: Colors.grey),
      labelText: labelText,
      prefixIcon: (prefixIcon != null)
          ? Icon(
              prefixIcon,
              color: Color(0xff425CCE),
            )
          : null,
    );
  }
}
