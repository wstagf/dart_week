import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
