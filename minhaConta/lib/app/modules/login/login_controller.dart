import 'package:flutter/material.dart';
import 'package:minhaConta/app/core/store_state.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';
import 'package:minhaConta/app/utils/store_utils.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final UsuarioRepository usuarioRepository;

  _LoginBase(this.usuarioRepository);

  @observable
  String login;

  @observable
  String senha;

  @action
  changeLogin(String loginValue) => login = loginValue;

  @action
  changeSenha(String senhaValue) => senha = senhaValue;

  @observable
  ObservableFuture<bool> _loginFuture;

  @observable
  String errorMessage;

  @observable
  bool loginSuccess;

  @action
  Future<void> requestLogin() async {
    if (globalKey.currentState.validate()) {
      try {
        errorMessage = '';
        loginSuccess = null;
        _loginFuture = ObservableFuture(usuarioRepository.login(login, senha));
        loginSuccess = await _loginFuture;
      } catch (e) {
        print(e);
        errorMessage = 'Erro ao realizar login';
      }
    }
  }

  @computed
  StoreState get state => StoreUtils.statusCheck(_loginFuture);

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
