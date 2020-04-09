import 'package:flutter/material.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final UsuarioRepository usuarioRepository ;

   _LoginBase(this.usuarioRepository);
   
  @observable
  String login;

  @observable
  String senha;

  @action
  changeLogin(String loginValue) => login = loginValue;

  @action
  changeSenha(String senhaValue) => senha = senhaValue;

  Future<void> requestLogin() {
    if (globalKey.currentState.validate()) {}
  }

  String validateLogin(String value) {
    if (value.isEmpty) {
      return 'Login obrigatório';
    }
    return null;
  }

  String validateSenha(String value) {
    if (value.isEmpty) {
      return 'Senha obrigatória';
    }
    return null;
  }
}
