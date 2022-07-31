import 'package:flutter/material.dart';

abstract class InputDecorations {
  static InputDecoration loginInputDecoration(
      String hintText, String labelText, Color color, IconData? prefixIcon) {
    return InputDecoration(
        enabledBorder: estiloLineaDebajo(color, 1),
        focusedBorder: estiloLineaDebajo(color, 2),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: color,
              )
            : null);
  }

  static UnderlineInputBorder estiloLineaDebajo(Color color, double grosor) =>
      UnderlineInputBorder(borderSide: BorderSide(color: color, width: grosor));
}