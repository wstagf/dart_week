import 'package:flutter/material.dart';

class ControlejaTextFormField extends TextFormField {
  ControlejaTextFormField(
      {ValueChanged<String> onChanged,
      FormFieldValidator<String> validator,
      @required String label,
      bool obscureText,
      double borderRadius,
      double fontSize,
      EdgeInsets padding,
      TextEditingController controller})
      : super(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            contentPadding: padding ?? EdgeInsets.fromLTRB(30, 20, 0, 20),
            labelText: label,
            labelStyle: TextStyle(fontSize: fontSize ?? 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
            ),
          ),
        );
}
