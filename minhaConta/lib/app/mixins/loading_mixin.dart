import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoagingMixin {
  showLoader() {
    Get.dialog(
      Container(
        width: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[CircularProgressIndicator()],
        ),
      ),
    );
  }

  hideLoader() {
    Get.back();
  }
}
