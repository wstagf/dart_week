import 'package:flutter/material.dart';
import 'package:minhaConta/app/utils/theme_utils.dart';

class ControleJaButtom extends RawMaterialButton {
  ControleJaButtom(
      {@required VoidCallback onPressed,
      @required String label,
      Color primaryColor,
      Color highlightColor})
      : super(
          onPressed: onPressed,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: primaryColor ?? ThemeUtils.primaryColor,
          highlightColor: highlightColor ?? ThemeUtils.primaryColor,
        );
}
